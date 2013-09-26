

require "erb"
require "pathname"

$:<< "./lib"
require "cloud-notes/user"

class String

	def to_html
		self.gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;").gsub("\"", "&quot;")
	end

end

content_type= {
	".css" => "text/css",
	".js" => "text/javasscript",
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

def do_login(user, title, request)
	cookie= {}
	login_time= Time.now.to_i.to_s
	login_token= user.login_token(login_time)
	Rack::Utils.set_cookie_header!(cookie, "login_name", user.name)
	Rack::Utils.set_cookie_header!(cookie, "login_time", login_time)
	Rack::Utils.set_cookie_header!(cookie, "login_token", login_token)
	location= "#{request.base_url}/"
	[303, cookie.merge("Location" => location), title, use_template("303.html", binding)]
end

data_dir= Pathname.new("data")

run(lambda do |env|

	request= Rack::Request.new(env)

	# serve static files
	if request.path_info=~ /\A\/[a-z]+\/([a-z-]+\.)+[a-z]+\Z/ and (path= Pathname.new("files")+request.path_info[1..-1]).file?
		return [200, {"Content-Type" => content_type[path.extname], "Content-Length" => path.size.to_s, "Last-Modified" => path.mtime.rfc2822}, path.open]
	end

	status, header, title, body= begin

		# check whether logged in
		user= CloudNotes::User.new(data_dir, "anonymous")
		if (request.cookies.keys & ["login_name", "login_time", "login_token"]).size == 3 and
		   Time.at(request.cookies["login_time"].to_i) > Time.now-60*60
			begin
				try_user= CloudNotes::User.new(data_dir, request.cookies["login_name"])
				try_user.authorize_with_token(request.cookies["login_token"], request.cookies["login_time"])
				user= try_user
			rescue CloudNotes::User::InvalidPasswordError
			end
		end

		# serve dynamic page
		case request.path_info
		# logout
		when "/logout"
			cookie= {}
			Rack::Utils.delete_cookie_header!(cookie, "login_name")
			Rack::Utils.delete_cookie_header!(cookie, "login_time")
			Rack::Utils.delete_cookie_header!(cookie, "login_token")
			location= "#{request.base_url}/"
			[303, cookie.merge("Location" => location), "Logged Out!", use_template("303.html", binding)]
		#login
		when "/login"
			if request.post? and (request.params.keys & ["login_name", "password"]).size == 2
				login_name= request.params["login_name"]
				password= request.params["password"]
				begin
					try_user= CloudNotes::User.new(data_dir, login_name)
					try_user.authorize(password)
					do_login(try_user, "Logged In!", request)
				rescue CloudNotes::User::InvalidUserNameError
				rescue CloudNotes::User::InvalidPasswordError
				end
			end or
			[200, {}, "Login", use_template("login.html", binding)]
		# signup
		when "/signup"
			if request.post? and (request.params.keys & ["login_name", "password", "repeated_password"]).size == 3
				login_name= request.params["login_name"]
				password= request.params["password"]
				repeated_password= request.params["repeated_password"]
				if not password.empty? and password == repeated_password
					begin
						try_user= CloudNotes::User.create(data_dir, login_name, password)
						do_login(try_user, "Logged In!", request)
					rescue CloudNotes::User::InvalidUserNameError
					rescue CloudNotes::User::UserExistsError
					end
				end
			end or
			[200, {}, "Signup", use_template("signup.html", binding)]
		# home
		when "/"
			if user.authorized?
				note_dir= user.note_name_prefix
				listing= user.list_notes(user.note_name_prefix)
				[200, {}, "Welcome", use_template("home-howto.html", binding)]
			else
				[200, {}, "Welcome", use_template("home-advertisement.html", binding)]
			end
		# create note
		when "/create"
			if request.post? and (request.params.keys & ["note_name", "note_content"]).size == 2
				note_name= user.note_name_prefix + request.params["note_name"]
				note_content= request.params["note_content"]
				note_password= request.params["note_password"]
				unless note_name.empty? or note_content.empty?
					begin
						note= user.set_note(note_name, note_content, note_password.empty? ? nil : note_password)
						location= "#{request.base_url}/view/#{note.name}"
						[303, {"Location" => location}, "Note Created!", use_template("303.html", binding)]
					rescue CloudNotes::Note::InvalidNoteNameError
					rescue CloudNotes::User::UnauthorizedError
					end
				end
			end or
			[200, {}, "Create Note", use_template("create.html", binding)]
		# view note
		when /\A\/view\//
			note_name= $'
			password= if request.post?
				request.params["password"]
			end
			begin
				note_content= user.get_note(note_name, password)
				[200, {}, "View note: #{note_name}", use_template("view.html", binding)]
			rescue CloudNotes::User::UnauthorizedError
				[403, {}, "Access to Note Denied", use_template("view-access-denied.html", binding)]
			rescue CloudNotes::Note::InvalidNoteNameError
				[404, {}, "404 Not Found", use_template("404.html", binding)]
			end
		# list notes
		when /\A\/list\/((.*\/|)\Z)/
			note_dir= $1
			begin
				listing= user.list_notes(note_dir)
				[200, {}, "Listing: #{note_dir}", use_template("list.html", binding)]
			rescue CloudNotes::Note::InvalidNoteNameError
				[404, {}, "404 Not Found", use_template("404.html", binding)]
			rescue CloudNotes::User::UnauthorizedError
				[404, {}, "404 Not Found", use_template("404.html", binding)]
			end
		else
			[404, {}, "404 Not Found", use_template("404.html", binding)]
		end
	rescue CloudNotes::Data::DataLockingError
		[502, {}, "502 Service Unavailable", use_template("502.html", binding)]
	end

	# apply default template
	use_default_template(binding, status, header)

end)

