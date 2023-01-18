class EngToBraille
  attr_reader :dictionary

  def initialize
    @dictionary = {
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
  end

  def braille_array(text_string)
    text_arr = text_string.chars 
    
    braille_arr = text_arr.map do |letter|
      @dictionary[letter]
    end
    braille_arr
  end

  def to_braille(input)
    message = braille_array(input)

    translate = message.each_slice(40).map do |slice|
      slice.transpose.map do |letter|
        letter.join
      end.join("\n")
    end
    translate.join("\n")
  end
end