require_relative 'test_helper'
require './lib/message'
require './lib/shift'

class MessageTest < Minitest::Test

  def setup
    @shift = Shift.new("02715", "1025")
    @shift.make_shift
    @message = Message.new("hello world", @shift.shift)
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

  def test_it_finds_index
    assert_equal "k", @message.move_alphabet("k")[0]
    assert_equal "keder ohulw", @message.change_message
  end
end
