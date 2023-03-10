class BrailleToEng
  attr_reader :inv_dictionary

  def initialize
    @inv_dictionary = {
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
    }.invert
  end

  def to_english_letter(braille_string)
    braille_arr = braille_string.split("\n")
    @inv_dictionary[braille_arr]
  end

  def to_character_rows(braille_string)
    braille_arr = braille_string.split("\n")

    row_array = braille_arr.map do |string|
      string.chars.each_slice(2).map do |char|
        char.join
      end
    end
  end
  
  def to_braille_letters(braille_string)
    row_array = to_character_rows(braille_string)

    braille_letters = row_array.each_slice(3).flat_map do |letter|
      letter.transpose
    end
  end
  
  def to_english_sentence(braille_string)
    braille_letters = to_braille_letters(braille_string)

    eng_letters = braille_letters.flat_map do |b_let|
      @inv_dictionary[b_let]
    end.join
    
    new_line_40 = eng_letters.chars.each_slice(40).map do |letter|
      letter.join
    end.join("\n")
  end
end