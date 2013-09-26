
require "bcrypt"
require "digest"

require "cloud-notes/data"
require "cloud-notes/note"

module CloudNotes

	class User

		class InvalidUserNameError < StandardError
		end
		class InvalidPasswordError < StandardError
		end
		class UnauthorizedError < StandardError
		end
		class UserExistsError < StandardError
		end

		def self.check_user_name(user_name)
			unless user_name=~ /\A[A-Za-z0-9_-]+\Z/
				raise InvalidUserNameError, "user name is invalid"
			end
		end

		def self.create(data_dir, user_name, password)
			check_user_name(user_name)
			user_dir= data_dir+"users"+user_name
			password_data= Data.new(user_dir+"password_hash")
			user= password_data.writelock do
				unless password_data.read.empty?
					raise UserExistsError, "user exists"
				end
				password_data.write(BCrypt::Password.create(password, :cost => 13).to_s)
				Note.save(data_dir, "#{user_name}/welcome", "Welcome #{user_name} to the best cloud note taking plattform.")
				note_name_prefix_data= Data.new(user_dir+"note_name_prefix")
				note_name_prefix_data.write("#{user_name}/")
				write_access_data= Data.new(user_dir+"write_access")
				write_access_data.write("true")
				self.new(data_dir, user_name)
			end
			user.send(:finish_authorization)
			user
		end

		def initialize(data_dir, user_name)
			@data_dir= data_dir
			self.class.check_user_name(user_name)
			@user_dir= data_dir+"users"+user_name
			@user_name= user_name
			@authorized= false
			@writey_access= false
			@note_name_prefix= nil
		end

		attr_reader :note_name_prefix

		def name
			@user_name
		end

		def authorize(password)
			password_data= Data.new(@user_dir+"password_hash")
			password_data.readlock do
				bcrypt_stuff= password_data.read
				unless not bcrypt_stuff.empty? and BCrypt::Password.new(password_data.read) == password
					raise InvalidPasswordError, "invalid password"
				end
			end
			finish_authorization
		end

		def finish_authorization
			write_access_data= Data.new(@user_dir+"write_access")
			@write_access= write_access_data.read == "true"
			note_name_prefix_data= Data.new(@user_dir+"note_name_prefix")
			@note_name_prefix= note_name_prefix_data.read
			@authorized= true
		end
		private :finish_authorization

		def check_authorized
			unless @authorized
				raise UnauthorizedError, "not authorized"
			end
		end

		def login_token(salt)
			check_authorized
			password_data= Data.new(@user_dir+"password_hash")
			password_data.readlock do
				Digest::SHA256.hexdigest(password_data.read+salt)
			end
		end

		def authorize_with_token(token, salt)
			password_data= Data.new(@user_dir+"password_hash")
			password_data.readlock do
				bcrypt_stuff= password_data.read
				unless not bcrypt_stuff.empty? and Digest::SHA256.hexdigest(bcrypt_stuff+salt) == token
					raise InvalidPasswordError, "invalid password"
				end
			end
			finish_authorization
		end

		def authorized?
			@authorized
		end

		def change_password(new_password)
			check_authorized
			password_data= Data.new(@user_dir+"password_hash")
			password_data.writelock do
				password_data.write(BCrypt::Password.create(new_password, :cost => 13).to_s)
			end
		end

		def test_prefix(note_name)
			@note_name_prefix and
			note_name[0, @note_name_prefix.size] == @note_name_prefix
		end

		def get_note(note_name, password= nil)
			note= Note.read(@data_dir, note_name, password)
			unless note.password_correct? or test_prefix(note_name)
				raise UnauthorizedError, "not authorized for this note"
			end
			note.content
		end

		def set_note(note_name, note_content, password)
			check_authorized
			unless @write_access
				raise UnauthorizedError, "not authorized"
			end
			unless test_prefix(note_name)
				raise UnauthorizedError, "not authorized for this note"
			end
			Note.save(@data_dir, note_name, note_content, password)
		end

		def list_notes(note_dir)
			check_authorized
			unless test_prefix(note_dir)
				raise UnauthorizedError, "not authorized for this directory"
			end
			Note.list(@data_dir, note_dir)
		end

	end

end

