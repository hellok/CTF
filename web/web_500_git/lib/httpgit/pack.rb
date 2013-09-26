
require "shellwords"

module HTTPGit

	def self.each_ref(path, prefix)
		base_dir= (path+"refs"+prefix)
		begin
			head_path= base_dir+"heads/master"
			if head_path
				yield("HEAD", head_path.read.strip)
			end
			base_dir.find do |p|
				next unless p.file?
				yield("refs/#{p.relative_path_from(base_dir)}", p.read.strip)
			end
		rescue Errno::ENOENT
		end
	end

	class Pack

		def initialize(path, prefix, size_limit, direction)
			@path= path
			@prefix= prefix
			@size_limit= size_limit
			@direction= direction
		end

	end

end
