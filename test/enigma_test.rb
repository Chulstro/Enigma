require_relative "test_helper"
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @date = Time.new(2020, 06, 06)
  end

  def test_it_can_encrypt
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal "a", Enigma.characters[0]
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
end
