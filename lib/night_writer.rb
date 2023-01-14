message_file = ARGV[0]
new_file = ARGV[1]

m_file = File.open("./text_files/#{message_file}", "r")
string = m_file.read
n_file = File.new("./text_files/#{new_file}", "w")

n_file.write(string.upcase)
n_file.close

puts "Created '#{new_file}' containing #{string.length} characters"
