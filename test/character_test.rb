require_relative "test_helper"
require './lib/character'

class CharacterTest < Minitest::Test

  def setup
    @a = Character.new("a")
  end

  def test_it_can_hold_character
    assert_equal "a", @a.id
  end
end
