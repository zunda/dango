class IO
	def puts_and_flush(*args)
		puts args
		flush
	end
end

loop do
	$stdout.puts_and_flush "Hi, I am repeating this in about 10 seconds"
	sleep 10
end
