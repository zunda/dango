puts "Hi, I am stopping"
10.downto(1) do |i|
	puts "in about #{i} seconds"
	sleep 1
end
puts "Bye"
