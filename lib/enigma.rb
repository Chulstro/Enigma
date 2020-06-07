require './lib/shift'
require './lib/message'

class Enigma
  attr_reader :offset, :key, :date, :shift
  @@characters = ("a".."z").to_a << " "

  def initialize
  end

  def self.characters
    @@characters
  end

  def add_offset
    finder = (@date.to_i ** 2).to_s
    @offset = format('%04d',finder[-4..-1])
  end

  def encrypt(message, key = format('%05d', rand(10000)), date = Time.now.strftime('%m%d%y'))
    accumulator = {}
    @key = key
    @date = date
    add_offset
    change = Shift.new(@key, @offset)
    change.make_shift
    @shift = change.shift

    @message = Message.new(message, @shift)
    accumulator[:encryption] = @message.change_message
    accumulator[:key] = @key
    accumulator[:date] = @date
    accumulator
  end

end
