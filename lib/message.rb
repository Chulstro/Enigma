require './lib/character'

class Message
  attr_reader :message_array, :shift, :characters

  def initialize(message, shift)
    @characters = ("a".."z").to_a << " "
    @message_array = message.chars
    @shift = shift
  end

  def move_alphabet(character)
    @characters.rotate(@characters.index(character.downcase))
  end

  def move_alphabet_reverse(character)
    rev_characters = @characters.reverse
    rev_characters.rotate(rev_characters.index(character.downcase))
  end

  def encrypt_message
    @message_array.map! do |character|
      Character.new(character)
    end
    @message_array.map do |character|
      if @characters.index(character.id.downcase) == nil
        character.id
      else
        find_new_char = move_alphabet(character.id)
        if (@message_array.index(character) + 4) % 4 == 0
          find_new_char.rotate(@shift[:A])[0]
        elsif (@message_array.index(character) + 3) % 4 == 0
          find_new_char.rotate(@shift[:B])[0]
        elsif (@message_array.index(character) + 2) % 4 == 0
          find_new_char.rotate(@shift[:C])[0]
        else
          find_new_char.rotate(@shift[:D])[0]
        end
      end
    end.join
  end

  def decrypt_message
    @message_array.map! do |character|
      Character.new(character)
    end
    @message_array.map do |character|
      if @characters.index(character.id.downcase) == nil
        character.id
      else
        find_new_char = move_alphabet_reverse(character.id)
        if (@message_array.index(character) + 4) % 4 == 0
          find_new_char.rotate(@shift[:A])[0]
        elsif (@message_array.index(character) + 3) % 4 == 0
          find_new_char.rotate(@shift[:B])[0]
        elsif (@message_array.index(character) + 2) % 4 == 0
          find_new_char.rotate(@shift[:C])[0]
        else
          find_new_char.rotate(@shift[:D])[0]
        end
      end
    end.join
  end
end
