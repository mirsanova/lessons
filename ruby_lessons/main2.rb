begin
	puts 'Before execption'
	1/0
	puts 'After execption'
rescue Execption =>
	puts "Execption: #{e.inspect}"
	puts e.backtrace.inspect

end
