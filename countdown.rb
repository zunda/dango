class IO
	def puts_and_flush(*args)
		puts args
		flush
	end
end

$stdout.puts_and_flush "Hi, I am stopping"
10.downto(1) do |i|
	$stdout.puts_and_flush "in about #{i} seconds"
	sleep 1
end
$stdout.puts_and_flush "Bye"
