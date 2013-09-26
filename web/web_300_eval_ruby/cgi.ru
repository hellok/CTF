#!/usr/bin/rackup

script= "./ruby-eval.cgi"

require "pathname"

# see: http://tools.ietf.org/html/rfc3875

ENV["SERVER_SOFTWARE"]= "cgi.ru/0.1"
ENV["GATEWAY_INTERFACE"]= "CGI/1.1"
ENV["SERVER_PROTOCOL"]= "HTTP/1.0"
ENV["AUTH_TYPE"]= ""

run(lambda do |env|
	[
		"PATH_INFO",
		"QUERY_STRING",
		"REQUEST_METHOD",
		"CONTENT_LENGTH",
		"CONTENT_TYPE",
		"REMOTE_ADDR",
		"SERVER_NAME",
		"SERVER_PORT",
	].each do |key|
		ENV[key]= env[key]
	end
	env.select do |k, v|
		k=~ /\AHTTP_/
	end.each do |k, v|
		ENV[k]= v
	end
	ENV["REMOTE_USER"]= if env["HTTP_AUTHORIZATION"]
		Rack::Auth::Basic::Request.new(env).username
	else
		nil
	end
	ENV["PATH_TRANSLATED"]= (Pathname.new(__FILE__).dirname+ENV["PATH_INFO"]).to_s

	in_cgi, out_here= IO.pipe
	in_here, out_cgi= IO.pipe
	pid= fork do
		STDIN.reopen(in_cgi)
		STDOUT.reopen(out_cgi)
		File.open("/dev/null", "w") do |f|
			STDERR.reopen(f)
		end
		exec(script)
	end
	out_here.write(env["rack.input"].read(4096))
	in_cgi.close
	out_cgi.close
	out_here.close
	cgi_output= in_here.read(4096) || ""
	in_here.close
	Process.wait(pid)

	raw_cgi_output_header, cgi_output_body= cgi_output.gsub("\n\r", "\n").split("\n\n", 2)
	cgi_output_header= (raw_cgi_output_header || "").split("\n").select do |r|
		r=~ /:/
	end.collect do |r|
		r.split(":", 2).collect(&:strip)
	end.inject({}) do |h, r|
		h[r[0].downcase]= r[1]
		h
	end
	cgi_output_header["content-type"]||= "application/octet-stream"
	cgi_output_header.delete("status")=~ /\A[1-9][0-9][0-9]/
	cgi_output_status= ($& || 500).to_i
	if cgi_output_header.keys.include?("x-sendfile")
		begin
			output_file_name= cgi_output_header.delete("x-sendfile")
			output_file= File.open(output_file_name)
			cgi_output_header["content-length"]= File.size(output_file_name).to_s
			[cgi_output_status, cgi_output_header, output_file]
		rescue Errno::ENOENT
			[500, {"content-type" => "text/plain"}, ["internal server error"]]
		end
	else
		cgi_output_header["content-length"]= (cgi_output_body || "").size.to_s
		[cgi_output_status, cgi_output_header, [cgi_output_body].compact]
	end
end)
