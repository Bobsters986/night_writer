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

  describe 'converting braille to english letters and words' do
    it '#to_english_letter' do
      braille_letter_m = "00\n..\n0."
      braille_letter_e = "0.\n.0\n.."
      expect(translator2.to_english_letter(braille_letter_m)).to eq("m")
      expect(translator2.to_english_letter(braille_letter_e)).to eq("e")
    end

    it '#to_character_rows' do
      braille_word = "000..0.00.000.\n...00.0...00.0\n0...0.0......."
      expect(translator2.to_character_rows(braille_word)).to eq(
      [["00", "0.", ".0", ".0", "0.", "00", "0."],
      ["..", ".0", "0.", "0.", "..", "00", ".0"],
      ["0.", "..", "0.", "0.", "..", "..", ".."]])
    end

    it '#to_braille_letters' do
      braille_word = "000..0.00.000.\n...00.0...00.0\n0...0.0......."
      expect(translator2.to_braille_letters(braille_word)).to eq([["00", "..", "0."], 
      ["0.", ".0", ".."], [".0", "0.", "0."], [".0", "0.", "0."],
      ["0.", "..", ".."], ["00", "00", ".."],["0.", ".0", ".."]])
    end

    it '#to_english_sentence' do
      braille_sentence = ".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..\n0000.0..00..0.......0.00.000.0..0..0....00....0.0....00..000..0000.0..0....0.0..\n0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000..\n000.00\n.0.000\n..0..."

      braille_word = "000..0.00.000.\n...00.0...00.0\n0...0.0......."

      expect(translator2.to_english_sentence(braille_word)).to eq("message")
      expect(translator2.to_english_sentence(braille_sentence)).to eq("the quick brown fox jumps over the lazy dog")
    end
  end
end