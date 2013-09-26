
module HTTPGit

	class TransferEncoder

		def initialize(content)
			@content= content
		end

		def each
			@content.each do |chunk|
				case chunk
				when String
					yield("%04x%s\n" % [chunk.size + 5, chunk])
				when nil
					yield("0000")
				end
			end
		end

		include Enumerable

	end

end

