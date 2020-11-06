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

    Util.print_char(7, Color::None, "+")
    Util.print_char(8, Color::None, Util.get_color(Color::None))

    mv = Move.new
    puts mv.is_border?
  end
end

# call main game loop here
Othello.main
