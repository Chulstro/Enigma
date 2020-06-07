
class Message
  attr_reader :message_array

  def initialize(message, shift)
    @characters = ("a".."z").to_a << " "
    @message_array = message.chars
  end

end
