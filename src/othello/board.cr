# board.cr
# require "./evaluate"
require "./algorithm"
require "./move"

class Board
  include Algorithm
  include Movelist

  @@black_discs = 2
  @@white_discs = 2

  def self.black_discs
    @@black_discs
  end

  def self.white_discs
    @@white_discs
  end

  property field : Array(Color)

  def initialize
    @field = Array(Color).new(64, Color::None)
    @field[27] = Color::White
    @field[28] = Color::Black
    @field[35] = Color::Black
    @field[36] = Color::White
  end
end
