# ruby colors.rb red.txt blue.txt

#ARGV == ["red.txt", "blue.txt"]
# ARGV[0] == "red.txt"
# ARGV[1] == "blue.txt"
# @user_input = ARGV

message_file = File.open(ARGV[0], "r")
new_file = File.new(ARGV[1], "w")

new_file.write(message_file.read.upcase)
new_file.close

lines = File.readlines(ARGV[1])
line_count = lines.size
text = lines.join
num_characters = text.length

puts "Created '#{ARGV[1]}' containing #{num_characters} characters"
