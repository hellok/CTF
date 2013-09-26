
require "bcrypt"

require "cloud-notes/data"

module CloudNotes

	class Note

		class InvalidNoteNameError < StandardError
		end

		def self.check_note_name(note_name)
			unless note_name=~ /\A([A-Za-z0-9_-]+\/)*[A-Za-z0-9_-]+\Z/
				raise InvalidNoteNameError, "invalid note name"
			end
		end

		def self.save(data_dir, note_name, note_content, password= nil)
			check_note_name(note_name)
			note_content_data= Data.new(data_dir+"notes"+(note_name+".note"))
			note_password_hash_data= Data.new(data_dir+"notes"+(note_name+".note_password_hash"))
			note_content_data.writelock do
				note_content_data.write(note_content)
				note_password_hash_data.writelock do
					note_password_hash_data.write(BCrypt::Password.create(password || rand(16**20).to_s(16), :cost => 13))
				end
			end
			self.new(note_name, note_content_data, true)
		end

		def self.read(data_dir, note_name, password= nil)
			check_note_name(note_name)
			note_password_hash_data= Data.new(data_dir+"notes"+(note_name+".note_password_hash"))
			note_content_data= Data.new(data_dir+"notes"+(note_name+".note"))
			password_correct= false
			note_content= nil
			note_password_hash_data.readlock do
				if password
					bcrypt_stuff= note_password_hash_data.read
					password_correct= if bcrypt_stuff.empty?
					# do not give away nonexistence through timings
						BCrypt::Password.create(password, :cost => 13)
						false
					else
						BCrypt::Password.new(note_password_hash_data.read) == password
					end
				end
				note_content_data.readlock do
					note_content= note_content_data.read
				end
			end
			self.new(note_name, note_content, password_correct)
		end
		
		def self.list(data_dir, note_dir)
			check_note_name(note_dir.sub(/\/\Z/, "").sub(/\A\Z/, "_"))
			(data_dir+"notes"+note_dir).children.collect do |child|
				if child.directory?
					[child.basename.to_s, :dir]
				elsif child.file? and child.basename.to_s=~ /\.note\Z/
					[child.basename.to_s.sub(/\.note\Z/, ""), :note]
				else
					nil
				end
			end.compact.inject({}) { |h, x| h[x[0]]= x[1]; h }
		end

		def initialize(note_name, note_content, password_correct)
			@note_name= note_name
			@note_content= note_content
			@password_correct= password_correct
		end

		def name
			@note_name
		end

		def content
			@note_content
		end

		def password_correct?
			@password_correct
		end

	end

end

