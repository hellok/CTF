
require "pathname"

module CloudNotes

	class Data

		class DataLockingError < StandardError
		end

		def initialize(path)
			@data_path= path
		end

		def read
			begin
				@data_path.read
			rescue Errno::ENOENT
				""
			end
		end

		def write(content)
			if content.empty?
				begin
					@data.path.unlink
				rescue Errno::ENOENT
				end
			else
				begin
					@data_path.open("w") do |f|
						f.write(content)
					end
				rescue Errno::ENOENT
					@data_path.dirname.mkpath
					retry
				end
			end
		end

		def retry_locking(&block)
			retry_countdown= 10
			begin
				block.call
			rescue DataLockingError => exception
				retry_countdown-= 1
				if retry_countdown > 0
					sleep 0.1
					retry
				end
				raise exception
			end
		end
		private :retry_locking

		def writelock(&block)
			lock_path= @data_path.dirname+(".lock_"+@data_path.basename.to_s)
			begin
				retry_locking do
					begin
						lock_path.open(File::WRONLY|File::CREAT|File::EXCL) { |f| }
					rescue Errno::ENOENT
						lock_path.dirname.mkpath
						retry
					rescue Errno::EEXIST
						raise DataLockingError, "unable to acquire writelock"
					end
				end

				block.call

			ensure
				begin
					lock_path.unlink
				rescue Errno::ENOENT
				rescue Errno::ENOTEMPTY
				end
			end
		end

		def readlock(&block)
			random_string= rand(16**20).to_s(16)
			lock_path= @data_path.dirname+(".lock_"+@data_path.basename.to_s)+random_string
			begin
				retry_locking do
					begin
						begin
							lock_path.dirname.mkdir
						rescue Errno::ENOENT
							lock_path.dirname.dirname.mkpath
							retry
						rescue Errno::EEXIST
						end
						lock_path.open("w") { |f| }
					rescue Errno::ENOENT
						retry
					rescue Errno::ENOTDIR
						raise DataLockingError, "unable to acquire readlock"
					end
				end

				block.call

			ensure
				begin
					lock_path.unlink
				rescue Errno::ENOENT
				end
				begin
					lock_path.dirname.rmdir
				rescue Errno::ENOTEMPTY
				end
			end
		end

	end

end

