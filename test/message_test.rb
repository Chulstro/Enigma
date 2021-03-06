require_relative 'test_helper'
require './lib/message'
require './lib/shift'

class MessageTest < Minitest::Test

  def setup
    @character = Character.new("a")
    @shift = Shift.new("02715", "1025")
    @shift.make_shift
    @message = Message.new("hello world", @shift.shift)
    @message_2 = Message.new("Hello World!", @shift.shift)
    @message_3 = Message.new("keder ohulw", @shift.shift)
    @message_4 = Message.new("keder ohulw!", @shift.shift)
  end

  def test_its_initial_values
    expected = {
      A: 3,
      B: 27,
      C: 73,
      D: 20
    }
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @message.message_array
    assert_equal expected, @message.shift
  end

  def test_it_can_encrypt
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "], @message.characters
    assert_equal "k", @message.move_alphabet("k")[0]
    assert_equal "keder ohulw", @message.encrypt_message
    assert_equal "keder ohulw!", @message_2.encrypt_message
  end

  def test_it_can_decrypt
    assert_equal "h", @message_3.move_alphabet_reverse("h")[0]
    assert_equal "hello world", @message_3.decrypt_message
    assert_equal "hello world!", @message_4.decrypt_message
  end
end
