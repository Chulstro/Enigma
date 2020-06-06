require_relative 'test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new("23415", "4400")
  end

  def test_initial_values
    assert_equal [23, 34, 41, 15], @shift.keys
    assert_equal [4, 4, 0 ,0], @shift.offsets
    @shift.make_shift

    expected = {
      A: 27,
      B: 38,
      C: 41,
      D: 15
    }

    assert_equal expected, @shift.shift
  end
end
