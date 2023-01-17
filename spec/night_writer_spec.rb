require './spec/spec_helper'

RSpec.describe 'night_writer' do
  let(:argv) { ['a_test_message.txt', 'braille_test.txt'] }

  it 'can open and read files' do
    test_message = argv[0]
    m_file = File.open("./text_files/#{test_message}", "r")
    string = m_file.read
    expect(string).to eq("message")
    expect(string.length).to eq(7)
  end
end