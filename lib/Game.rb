require_relative 'Display.rb'

class Game
  include Display
  
  attr_reader :board, :curr_guess
  def initialize
    @board = Board.new
    @curr_guess = nil
  end

  def play
    setup
    until game_over?
      @curr_guess = turn
    end
  end

  def setup
    create_code
  end

  def game_over?
    if curr_guess.equal?(board.code)
      puts display_cb_win
      return true
    elsif board.sequences.length == 12
      puts display_cm_win
      return true
    end
    false
  end

  def create_code
    print display_codemaker_prompt.chomp
    # TODO - create input validation
    seq = Sequence.new(gets.chomp.upcase.split(""))
    @board.code = seq
  end

  def turn
    print display_turn_prompt
    guessed_seq = Sequence.new(gets.chomp.upcase.split(""))
    board.add_sequence(guessed_seq)
    board.display
    guessed_seq
  end
end