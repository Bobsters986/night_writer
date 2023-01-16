require './lib/english_to_braille'

RSpec.describe EngToBraille do
  let(:translator) { EngToBraille.new }

  describe '#initialize' do

    it 'exists' do
      expect(translator).to be_an(EngToBraille)
    end

    it 'has an english to braille dictionary' do
      expected = {
      'a' => ['0.', '..', '..'],
      'b' => ['0.', '0.', '..'],
      'c' => ['00', '..', '..'],
      'd' => ['00', '.0', '..'],
      'e' => ['0.', '.0', '..'],
      'f' => ['00', '0.', '..'],
      'g' => ['00', '00', '..'],
      'h' => ['0.', '00', '..'],
      'i' => ['.0', '0.', '..'],
      'j' => ['.0', '00', '..'],
      'k' => ['0.', '..', '0.'],
      'l' => ['0.', '0.', '0.'],
      'm' => ['00', '..', '0.'],
      'n' => ['00', '.0', '0.'],
      'o' => ['0.', '.0', '0.'],
      'p' => ['00', '0.', '0.'],
      'q' => ['00', '00', '0.'],
      'r' => ['0.', '00', '0.'],
      's' => ['.0', '0.', '0.'],
      't' => ['.0', '00', '0.'],
      'u' => ['0.', '..', '00'],
      'v' => ['0.', '0.', '00'],
      'w' => ['.0', '00', '.0'],
      'x' => ['00', '..', '00'],
      'y' => ['00', '.0', '00'],
      'z' => ['0.', '.0', '00'],
      ' ' => ['..', '..', '..']
    }
    expect(translator.dictionary).to eq(expected)
    end
  end

  describe 'it can translate letters and words' do
    it 'can return an array of #braille_array letters ' do
      expect(translator.braille_array("a")).to eq([['0.', '..', '..']])
      expect(translator.braille_array("ab")).to eq([['0.', '..', '..'], ['0.', '0.', '..']])
    end

    it 'can translate letters and words #to_braille in order with proper line breaks' do
      expect(translator.to_braille("a")).to eq("0.\n..\n..")
      expect(translator.to_braille("ab")).to eq("0.0.\n..0.\n....")
      expect(translator.to_braille("hello")).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
    end

    it 'will line break at 40 alpha/80 braille characters' do
      long_line = "aaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbccccc"
      expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n........................................0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n0000000000\n..........\n.........."

      expect(translator.to_braille(long_line)).to eq(expected)
    end
  end

end