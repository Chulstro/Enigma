require './lib/shift'
require './lib/message'

class Enigma
  attr_reader :key, :date
  @@characters = ("a".."z").to_a << " "

  def initialize
  end

  def self.characters
    @@characters
  end

  def add_offset(date)
    finder = (date.to_i ** 2).to_s
    offset = format('%04d',finder[-4..-1])
  end

  def encrypt(message, key = format('%05d', rand(10000)), date = Time.now.strftime('%m%d%y'))
    @key = key
    @date = date
    accumulator = {}
    change = Shift.new(key, add_offset(date))
    change.make_shift

    message = Message.new(message, change.shift)
    accumulator[:encryption] = message.encrypt_message
    accumulator[:key] = key
    accumulator[:date] = date
    accumulator
  end

  def decrypt(message, key, date = Time.now.strftime('%m%d%y'))
    @key = key
    @date = date
    accumulator = {}
    change = Shift.new(key, add_offset(date))
    change.make_shift
    message = Message.new(message, change.shift)

    accumulator[:decryption] = message.decrypt_message
    accumulator[:key] = key
    accumulator[:date] = date
    accumulator
  end

end
