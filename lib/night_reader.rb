# require './lib/'

braille_file = ARGV[0]
new_file = ARGV[1]
# translate = 

b_file = File.open("./text_files/#{braille_file}", "r")
to_eng_file = File.new("./text_files/#{new_file}", "w")

# braille_words = b_file.read
to_eng_file.write #(translate.to_braille(braille_words))

puts "Created '#{new_file}' containing #{braille_words.length} characters"