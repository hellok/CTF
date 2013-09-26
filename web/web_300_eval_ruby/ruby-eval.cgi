#!/usr/bin/ruby

require "cgi"

cgi= CGI.new

output_file, content_type= case cgi.path_info
when "/bootstrap.min.css"
	["bootstrap.min.css", "text/css"]
when "/jquery-1.9.1.min.js"
	["jquery-1.9.1.min.js", "application/javascript"]
when "/"
	["index.html", "text/html"]
when "/eval"
	if cgi["script"]
		nil
	else
		["404.html", "text/html"]
	end
else
	["404.html", "text/html"]
end

if output_file
	cgi.out({
		"Status" => "200 OK",
		"Content-Type" => content_type,
		"X-Sendfile" => output_file,
	}) { "" }
	exit 0
end

script= case cgi["script"]
when String
	cgi["script"]
when StringIO
	cgi["script"].read
when IO
	cgi["script"].read
end
scriptfile= "/tmp/"+rand(16**20).to_s(16)+".rb"
outfile= "/tmp/"+rand(16**20).to_s(16)+".out"
begin
	File.open(scriptfile, "w") do |f|
		f.write(script)
	end
	File.open(outfile, "w") { |f| }

	pid= nil
	trap("CLD") do
		Process.wait(pid)
		cgi.out({
			"Status" => "200 OK",
			"Content-Type" => "application/octet-stream",
		}) do
			File.read(outfile)
		end
		exit 0
	end
	pid= fork do
		ENV.clear
		ruby_e= <<EOF
			require "rubygems"
			require "ffi"

			class Filter < FFI::Struct
				layout :code, :uint16,
				       :jt, :uint8,
				       :jf, :uint8,
				       :k, :uint32
			end

			class FProg < FFI::Struct
				layout :len, :ushort,
				       :filter, Filter.ptr
			end

			script= File.read(ARGV[0])
			File.open(ARGV[1], "w") do |f|
				STDOUT.reopen(f)
			end
			filter= FFI::MemoryPointer.new(Filter, 14)
			filters= (filter.size/Filter.size).times.collect do |i|
				Filter.new(filter + i * Filter.size)
			end
			filters[0][:code]= 0x20
			filters[0][:k]= 0
			[1, 8, 12, 9, 14, 97, 13, 3, 72, 16, 5].each_with_index do |nr, i|
				filters[1+i][:code]= 0x15
				filters[1+i][:jt]= 11-i
				filters[1+i][:k]= nr
			end
			filters[12][:code]= 0x06
			filters[12][:k]= 0x00000000
			filters[13][:code]= 0x06
			filters[13][:k]= 0x7fff0000
			prog= FProg.new
			prog[:len]= filters.size
			prog[:filter]= filters[0]
			Process.setrlimit(Process::RLIMIT_AS, 30*1024**3)
			Process.setrlimit(Process::RLIMIT_FSIZE, 4096)
			syscall(157, 38, 1, 0, 0, 0)
			syscall(157, 22, 2, prog.pointer.to_i)
			eval(script)
			exit(0)
EOF
		exec("ruby", "-e", ruby_e,scriptfile, outfile)
	end
	sleep 2
	Process.kill(9, pid)
	sleep
ensure
	[scriptfile, outfile].each do |file|
		begin
			File.unlink(file)
		rescue Errno::ENOENT
		end
	end
end

