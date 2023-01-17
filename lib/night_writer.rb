require './lib/english_to_braille'

message_file = ARGV[0]
new_file = ARGV[1]
translate = EngToBraille.new

m_file = File.open("./text_files/#{message_file}", "r")
to_braille_file = File.new("./text_files/#{new_file}", "w")

text_string = m_file.read
to_braille_file.write(translate.to_braille(text_string))

puts "Created '#{new_file}' containing #{text_string.length} characters"