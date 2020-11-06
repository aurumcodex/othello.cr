# evaluate.cr
module Evaluation
  # extend self

  struct Scores
    property black, white, score

    def initialize(@black : Int32, @white : Int32)
      @score = @black - @white
    end
  end

  def calc_score_disc
    black_count = 0
    white_count = 0

    self.board.each do |cell|
      case cell
      when Color::Black
        black_count += 1
      when Color::White
        white_count += 1
      else
      end
    end
    Score.new(black_count, white_count)
  end

  def calc_score_weight
    black_count = 0
    white_count = 0

    self.board.each_with_index do |cell, index|
      case cell
      when Color::Black
        black_count += WEIGHTS[index]
      when Color::White
        white_count += WEIGHTS[index]
      else
      end
      Score.new(black_count, white_count)
    end
  end

  def print_results(scores : Scores)
    if scores.black > scores.white
      puts "player black wins."
      puts "black pieces: #{scores.black}"
      puts "white pieces: #{scores.white}"
    elsif scores.black < scores.white
      puts "player white wins."
      puts "black pieces: #{scores.black}"
      puts "white pieces: #{scores.white}"
    else
      puts "a tie occured."
      puts "black pieces: #{scores.black}"
      puts "white pieces: #{scores.white}"
    end
  end
end
