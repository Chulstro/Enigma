
class Message
  attr_reader :message_array, :shift

  def initialize(message, shift)
    @characters = ("a".."z").to_a << " "
    @message_array = message.chars
    @shift = shift
  end

  def move_alphabet(character)
    @characters.rotate(@characters.index(character.downcase))
  end

  def change_message
    @message_array.map do |character|
      find_new_char = move_alphabet(character)
      if (@message_array.index(character) + 4) % 4 == 0
        find_new_char.rotate(@shift[:A])[0]
      elsif (@message_array.index(character) + 3) % 4 == 0
        find_new_char.rotate(@shift[:B])[0]
      elsif (@message_array.index(character) + 2) % 4 == 0
        find_new_char.rotate(@shift[:C])[0]
      else
        find_new_char.rotate(@shift[:D])[0]
      end
    end.join
  end

end
