#!/usr/bin/rackup

require "erb"
require "pathname"
require "bcrypt"

$:<< "./lib"
require "httpgit/inforefs"
require "httpgit/uploadpack"
require "httpgit/receivepack"

class String

	def to_html
		self.gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;").gsub("\"", "&quot;")
	end

end

content_type= {
	".css" => "text/css",
	".png" => "image/png",
}

def use_template(name, bind)
	template_path= Pathname.new("templates") + name
	begin
		template= ERB.new(template_path.read, nil, "%")
	rescue Errno::ENOENT
		raise TemplateError
	end
	template.result(bind)
end

def use_default_template(bind, status= 200, header= {})
	raw= use_template("default.html", bind)
	[status, { "Content-Type" => "text/html", "max-age" => "60" }.merge(header), [raw]]
end

user_dir= Pathname.new("user")
git_dir= Pathname.new("git")
size_limit= 16*1024

run(lambda do |env|

	request= Rack::Request.new(env)

	# serve static files
	if request.path_info=~ /\A\/[a-z]+\/([a-z-]+\.)+[a-z]+\Z/ and (path= Pathname.new("files")+request.path_info[1..-1]).file?
		return [200, {"Content-Type" => content_type[path.extname], "Content-Length" => path.size.to_s, "Last-Modified" => path.mtime.rfc2822}, path.open]
	end

	status, header, body, title= begin

		case request.path_info
		when /\/([A-Za-z0-9]{10})($|\/)/
			repo_name= $1
			username, password= if env["HTTP_AUTHORIZATION"]
				Rack::Auth::Basic::Request.new(env).credentials
			end
			if username != repo_name or
			   not (user_dir+username).file? or
			   not BCrypt::Password.new((user_dir+username).read.chomp) == password
				[401, {"WWW-Authenticate" => "Basic realm=#{repo_name}", "Content-Type" => "empty"}, []]
			end or

			case request.path_info
			when /\/info\/refs\Z/
				case request.params["service"]
				when "git-upload-pack"
					HTTPGit::InfoRefs.new(git_dir, repo_name, :upload).call(env)
				when "git-receive-pack"
					HTTPGit::InfoRefs.new(git_dir, repo_name, :receive).call(env)
				else
					[404, {}, use_template("404.html", binding), "404 Not Found"]
				end
			when /\/git-upload-pack\Z/
				HTTPGit::UploadPack.new(git_dir, repo_name, size_limit).call(env)
			when /\/git-receive-pack\Z/
				HTTPGit::ReceivePack.new(git_dir, repo_name, size_limit).call(env)
			else
				[404, {}, use_template("404.html", binding), "404 Not Found"]
			end
		when "/"
			if request.post?
				repo_id= "%010x" % rand(16**10)
				password= "%010x" % rand(16**10)
				(user_dir+repo_id).open("w") do |f|
					f.puts BCrypt::Password.create(password)
				end
				[200, {}, use_template("create.html", binding), "create"]
			else
				[200, {}, use_template("index.html", binding), "create"]
			end
		else
			[404, {}, use_template("404.html", binding), "404 Not Found"]
		end
	end

	# apply default template
	if header["Content-Type"].nil?
		use_default_template(binding, status, header)
	else
		[status, header, body]
	end

end)

