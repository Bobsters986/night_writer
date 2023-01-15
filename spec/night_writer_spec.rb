# require './lib/night_writer'
# require './text_files/test_message'

describe 'night_writer' do
  let(:argv) { ['test_message.txt', 'upcase.txt'] }

  it 'can open and read files' do
    test_message = argv[0]
    m_file = File.open("./text_files/#{test_message}", "r")
    string = m_file.read
    expect(string).to eq("here is a message to be translated")
    expect(string.length).to eq(34)
  end

  # it 'can write files' do
  #   test_message = argv[0]
  #   new_file = argv[1]
  #   m_file = File.open("./text_files/#{test_message}", "r")
  #   string = m_file.read
  #   n_file = File.new("./text_files/#{new_file}", "w")
  #   new_new = n_file.write(string.upcase)
  #   read_new_file = File.open("./text_files/#{new_new}", "r")

  #   translated_string = read_new_file.read
    
  #   expect(translated_string).to eq("HERE IS A MESSAGE TO BE TRANSLATED")
  # end

end