# TODO: Write documentation for `Othello`
require "colorize"

require "./othello/*"

module Othello
  extend self
  VERSION = "0.1.0"

  COLORIZE = true # will make this a local variable later

  def main
    board = Board.new(Color::Black)
    movelist = board.generate_moves(Color::Black)

    board.display(movelist, COLORIZE)
    puts "movelist"
    # puts movelist
    movelist.each do |m|
      m.display(Color::Black)
    end

    cells = Moves.get_cells(movelist)
    board.player.get_input(cells, board.bot)
  end
end

# call main game loop here
Othello.main
