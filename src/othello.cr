# TODO: Write documentation for `Othello`
require "colorize"

require "./othello/*"

module Othello
  extend self
  VERSION = "0.1.0"

  COLORIZE = false # will make this a local variable later

  def main
    board = Board.new(Color::White)
    movelist = board.generate_moves(Color::Black)

    board.display(movelist, COLORIZE)
  end
end

# call main game loop here
Othello.main
