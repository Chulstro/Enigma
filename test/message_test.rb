require_relative 'test_helper'
require './lib/message'
require './lib/shift'

class MessageTest < Minitest::Test

  def setup
    @shift = Shift.new("23415", "4400")
    @shift.make_shift
    @message = Message.new("Fight me", @shift.shift)
  end

  def test_its_initial_values
    expected = {
      A: 27,
      B: 38,
      C: 41,
      D: 15
    }
    assert_equal ["F", "i", "g", "h", "t", " ", "m", "e"], @message.message_array
    assert_equal expected, @message.shift
  end

  def test_it_finds_index
    assert_equal "f", @message.move_alphabet("f")[0]
    assert_equal "ftuwtk t", @message.change_message
  end
end
