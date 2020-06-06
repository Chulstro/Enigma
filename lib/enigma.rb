require './lib/shift'

class Enigma
  attr_reader :offset, :key, :date, :shift
  @@characters = ("a".."z").to_a << " "

  def initialize
  end

  def self.characters
    @@characters
  end

  def encrypt(message, key = rand(10000), date = Time.now)
    @key = format('%05d', key)
    @date = date.strftime('%m%d%y')

    add_offset
    change = Shift.new(@key, @offset)
    change.make_shift
    @shift = change.shift
  end

  def add_offset
    finder = (@date.to_i ** 2).to_s
    @offset = format('%04d',finder[-4..-1])
  end
end
