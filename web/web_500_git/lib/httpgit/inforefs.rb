
require "httpgit/pack"
require "httpgit/transferencoder"

module HTTPGit

	class InfoRefs

		def initialize(path, prefix, direction)
			@path= path
			@prefix= prefix
			@direction= direction
		end

		def call(env)
			ref_result= []
			ref_result<< "# service=git-#{@direction}-pack"
			ref_result<< nil
			HTTPGit.each_ref(@path, @prefix) do |name, sha|
				ref_result<< "#{sha} #{name}"
			end
			ref_result<< nil
			[200, { "Content-Type" => "application/x-git-#{@direction}-pack-advertisement", "Cache-Control" => "no-cache" }, TransferEncoder.new(ref_result)]
		end

	end
end

