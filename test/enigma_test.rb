require_relative "test_helper"
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @message = Enigma.new
    @date = Time.new(2020, 06, 06)
  end

  def test_it_can_encrypt
    assert_equal "a", Enigma.characters[0]
    assert_equal "ftuwtk t 23415", @message.encrypt("Fight me", "23415", @date)
  end
end
