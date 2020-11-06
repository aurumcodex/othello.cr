# player.cr
require "./bot"

class Player
  include Bot

  property color : Color
  property human : Bool
  property passing : Bool

  def initialize(color : Color, human : Bool)
    @color = color
    @human = human
    @passing = false
  end

  def get_input(cells : Array(Int32))
    puts self.color, self.human, self.passing
  end

  def get_pass_input
    puts self
  end
end
