require './lib/english_to_braille'

message_file = ARGV[0]
new_file = ARGV[1]

m_file = File.open("./text_files/#{message_file}", "r")
translated_file = File.new("./text_files/#{new_file}", "w")

text_string = m_file.read
translated_file.write(EngToBraille.to_braille(text_string))
# translated_file.write(text_string.upcase)
# translated_file.close

puts "Created '#{new_file}' containing #{text_string.length} characters"