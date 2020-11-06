# move.cr
class Move
  property cell : Int32
  property num_flips : Int32
  property direction : Direction

  def initialize
    @cell = -1
    @num_flips = 0
    @direction = Direction::Null
  end

  def is_border?
    if Util::LEFT_BORDER.includes? self.cell
      if self.direction == Direction::West.invert ||
         self.direction == Direction::NWest.invert ||
         self.direction == Direction::SWest.invert
        return true
      end
    elsif Util::RIGHT_BORDER.includes? self.cell
      if self.direction == Direction::East.invert ||
         self.direction == Direction::NEast.invert ||
         self.direction == Direction::SEast.invert
        return true
      end
    else
      return false
    end
  end

  def display(color)
    # self.format(stdout)
    print "#{color} #{Util.get_col(@cell)} #{Util.get_row(@cell)}"
  end
end

module Movelist
  def get_legal_move(index, dir, color) : Move
  end

  def generate_moves(color) : Array(Move)
  end
end

module Moves
  extend self # important to extend self

  def check_wall(cell, direction)
    case direction
    when Direction::East
      if Util::RIGHT_BORDER.includes? cell
        return true
      end
    when Direction::West
      if Util::LEFT_BORDER.includes? cell
        return true
      end
    when Direction::NEast
      if Util::RIGHT_BORDER.includes? cell || Util::TOP_BORDER.includes? cell
        return true
      end
    when Direction::NWest
      if Util::LEFT_BORDER.includes? cell || Util::BOTTOM_BORDER.includes? cell
        return true
      end
    when Direction::SEast
      if Util::RIGHT_BORDER.includes? cell || Util::TOP_BORDER.includes? cell
        return true
      end
    when Direction::SWest
      if Util::LEFT_BORDER.includes? cell || Util::BOTTOM_BORDER.includes? cell
        return true
      end
    else
      return false
    end
  end

  def get_cells(moveset)
    result : Array(Int32)
    moveset.each do |cell|
      result << cell.cell
    end
    result
  end
end
