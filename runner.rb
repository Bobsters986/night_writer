# ruby colors.rb red.txt blue.txt

#ARGV == ["red.txt", "blue.txt"]
# ARGV[0] == "red.txt"
# ARGV[1] == "blue.txt"
@user_input = ARGV

message_file = File.open(ARVG[0], "r")
new_file = File.new(ARVG[1], "w")

new_file.write(message_file.read.downcase)
new_file.close
