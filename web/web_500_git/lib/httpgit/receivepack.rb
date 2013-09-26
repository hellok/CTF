
require "httpgit/pack"

module HTTPGit

	class ReceivePack < Pack

		def initialize(path, prefix, size_limit)
			super(path, prefix, size_limit, :receive)
		end

		def call(env)
			ENV["GIT_DIR"]= @path.to_s

			update_refs= TransferDecoder.new(env["rack.input"]).collect do |l|
				next unless l.chomp=~ /\A([a-z0-9]{40}) ([a-z0-9]{40}) (refs\/[a-zA-Z0-9+_\/-]+)\Z/
				[$1, $2, $3]
			end
			input= env["rack.input"].read(@size_limit)
			env["rack.input"].rewind

			pack_name= IO.popen("git index-pack --keep --stdin", "w+") do |io|
				io.write(input)
				(io.read.split("\t")[1] || "").strip
			end
			if pack_name.empty?
				return [400, { "Content-Type" => "application/x-git-type-result" }, []]
			end

			pack_file= @path+"objects/pack/pack-#{pack_name}.pack"
			idx_file= @path+"objects/pack/pack-#{pack_name}.idx"
			keep_file= @path+"objects/pack/pack-#{pack_name}.keep"
			received_objects= IO.popen("git show-index < #{idx_file.to_s}") do |io|
				io.collect do |l|
					l.split(" ")[1]
				end
			end

			update_refs.each do |old, new, name|
				ref_path= @path+name.gsub("refs/", "refs/#{@prefix}/")
				next unless received_objects.include?(new)
				next unless system("git", "cat-file", "-e", new)
				if ref_path.exist?
					next unless ref_path.file?
					next unless old == ref_path.read
				else
					next unless old == "0"*40
					ref_path.dirname.mkpath
				end
				ref_path.open("w") do |f|
					f.puts new
				end
			end
			keep_file.unlink

			[200, { "Content-Type" => "application/x-git-type-result" }, []]
		end

	end

end

