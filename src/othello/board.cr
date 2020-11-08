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
  property player : Player
  property bot : Player

  def initialize(color)
    @field = Array(Color).new(64, Color::None)
    @field[27] = Color::White
    @field[28] = Color::Black
    @field[35] = Color::Black
    @field[36] = Color::White

    @player = Player.new(color, true)
    @bot = Player.new(color.invert, false)
  end # end initializer

  def apply(color, cell, debug)
    if self.field[cell] == Color::None
      if debug
        puts "applying move at cell: #{cell}"
        puts "cell was originally: #{self.field[cell]}"
      end

      self.field[cell] = color

      if debug
        puts "cell is now: #{self.field[cell]}"
      end
    end
  end

  def flip_discs(color, dir, cell, debug)
    temp = cell

    while temp >= 0 && cell < 64
      temp = temp + dir.value

      if debug
        puts "current cell: #{temp}"
      end

      if temp < 64
        if self.field[temp] == color
          break
        else
          self.field[temp] = color
        end
      end
    end
  end

  def display(moveset, colorize?)
    cells = Moves.get_cells(moveset)

    puts "bot is #{Util.shorten(self.bot.color)} | player is #{Util.shorten(self.player.color)}"
    puts "  ._a_b_c_d_e_f_g_h_"

    self.field.each_with_index do |cell, index|
      if index % 8 == 0
        print " #{Util.get_row(index)}|"
      end

      if cells.includes? index
        Util.print_char(index, cell, "+", colorize?)
        next
      else
        Util.print_char(index, cell, Util.shorten(cell), colorize?)
      end
    end
  end

  def is_game_over?
    return @player.passing && @bot.passing
  end
end
