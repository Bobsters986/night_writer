require './lib/braille_to_english'

RSpec.describe BrailleToEng do
  let(:translator2) { BrailleToEng.new }

  describe '#initialize' do

    it 'exists' do
      expect(translator2).to be_a(BrailleToEng)
    end

    it 'can invert the original braille dictionary with #inv_dictionary' do
      expected = {
      ["0.", "..", ".."] => "a",
      ["0.", "0.", ".."] => "b",
      ["00", "..", ".."] => "c",
      ["00", ".0", ".."] => "d",
      ["0.", ".0", ".."] => "e",
      ["00", "0.", ".."] => "f",
      ["00", "00", ".."] => "g",
      ["0.", "00", ".."] => "h",
      [".0", "0.", ".."] => "i",
      [".0", "00", ".."] => "j",
      ["0.", "..", "0."] => "k",
      ["0.", "0.", "0."] => "l",
      ["00", "..", "0."] => "m",
      ["00", ".0", "0."] => "n",
      ["0.", ".0", "0."] => "o",
      ["00", "0.", "0."] => "p",
      ["00", "00", "0."] => "q",
      ["0.", "00", "0."] => "r",
      [".0", "0.", "0."] => "s",
      [".0", "00", "0."] => "t",
      ["0.", "..", "00"] => "u",
      ["0.", "0.", "00"] => "v",
      [".0", "00", ".0"] => "w",
      ["00", "..", "00"] => "x",
      ["00", ".0", "00"] => "y",
      ["0.", ".0", "00"] => "z",
      ["..", "..", ".."] => " "
      }
    expect(translator2.inv_dictionary).to eq(expected)
    end
  end
end