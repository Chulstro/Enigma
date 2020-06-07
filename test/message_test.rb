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
    assert_equal ["F", "i", "g", "h", "t", " ", "m", "e"], @message.message_array
  end
end
