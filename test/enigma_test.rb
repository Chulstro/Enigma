require_relative "test_helper"
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @message = Enigma.new
  end

  def test_it_can_encrypt
    @message.encrypt("Fight me")
    assert_equal "a", Enigma.characters[0]
  end
end
