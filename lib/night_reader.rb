require './lib/braille_to_english'

braille_file = ARGV[0]
new_file = ARGV[1]
translate = BrailleToEng.new

b_file = File.open("./text_files/#{braille_file}", "r")
to_eng_file = File.new("./text_files/#{new_file}", "w")

braille_words = b_file.readlines
# to_eng_file.write #(translate.to_braille(braille_words))

puts "Created '#{new_file}' containing #{braille_words.length} characters"