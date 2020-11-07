# TODO: Write documentation for `Othello`
require "colorize"

require "./othello/*"

module Othello
  extend self
  VERSION = "0.1.0"

  def main
    puts Color::White.black?
    puts Color::White.invert

    puts Direction::North.invert

    player = Player.new(Color::None, true)
    player.get_input(Array{0})
    player.make_move

    puts typeof(Util::DIRECTIONS)
    puts Move.new.display(Direction::North)

    test = Array{0, 1, 2, 4, 8, 16}
    test.each_with_index do |i, c|
      puts "#{i}, #{c}"
    end

    Util.print_char_color(8, Color::None, Util.shorten(Color::None))
    Util.print_char_color(7, Color::None, "+")

    mv = Move.new
    mv.display(Color::Black)
    puts mv.is_border?
    puts 9 + Direction::North.value

    board = Board.new
    puts typeof(board.field)
    puts board.field.size
    puts board.field
  end
end

# call main game loop here
Othello.main
