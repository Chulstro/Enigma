
class Shift
  attr_reader :keys, :offsets, :shift

  def initialize(key, date)
    @keys = [key[0..1].to_i, key[1..2].to_i, key[2..3].to_i, key[3..4].to_i]
    @offsets = [date[0].to_i, date[1].to_i, date[2].to_i, date[3].to_i]
  end

  def make_shift
    @shift ={
      A: @keys[0] + offsets[0],
      B: @keys[1] + offsets[1],
      C: @keys[2] + offsets[2],
      D: @keys[3] + offsets[3]
    }
  end

end
