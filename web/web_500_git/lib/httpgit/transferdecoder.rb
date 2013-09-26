
module HTTPGit

	class TransferDecoder

		def initialize(input)
			@input= input
		end

		def each
			loop do
				size= @input.read(4) || ""
				return if size.size < 4
				size= size.to_i(16)-4
				return if size < 0
				data= @input.read(size) || ""
				return if data.size < size
				yield(data)
			end
		end

		include Enumerable

	end

end

