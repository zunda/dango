class IO
	def puts_and_flush(*args)
		puts args
		flush
	end
end

$stdout.puts_and_flush "Hi, I am stopping"
$stdout.puts_and_flush "in about 10 seconds"
sleep 10
$stdout.puts_and_flush "Bye"
