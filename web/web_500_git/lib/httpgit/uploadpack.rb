
require "httpgit/pack"
require "httpgit/transferencoder"
require "httpgit/transferdecoder"

module HTTPGit

	class UploadPack < Pack

		def initialize(path, prefix, size_limit)
			super(path, prefix, size_limit, :upload)
		end

		def call(env)
			ENV["GIT_DIR"]= @path.to_s

			want_refs= TransferDecoder.new(env["rack.input"]).collect do |l|
				next unless l.chomp=~ /\Awant ([a-z0-9]{40})\Z/
				$1
			end
			have_refs= TransferDecoder.new(env["rack.input"]).collect do |l|
				next unless l.chomp=~ /\Ahave ([a-z0-9]{40})\Z/
				$1
			end.compact
			env["rack.input"].rewind

			want_refs= IO.popen("git rev-list --stdin | egrep '#{want_refs.join("|")}' 2>/dev/null", "w+") do |io|
				HTTPGit.each_ref(@path, @prefix) do |name, sha|
					io.puts sha
				end
				io.close_write
				io.collect { |l| l.chomp }
			end

			raw_output= if have_refs.size > 0
				have_refs.collect do |ref|
					"ACK #{ref}"
				end
			else
				["NAK"]
			end
			output= TransferEncoder.new(raw_output).to_a.join

			output+= IO.popen("git rev-list --stdin --objects | git pack-objects --quiet --stdout", "w+") do |io|
				have_refs.each do |ref|
					io.puts "^#{ref}"
				end
				want_refs.each do |ref|
					io.puts ref
				end
				io.close_write
				io.read(@size_limit)
			end

			[200, { "Content-Type" => "application/x-git-type-result" }, [output].compact]
		end

	end


end
