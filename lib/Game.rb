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
    code = get_seq
    @board.code = code
  end

  def get_seq
    seq = Sequence.new(gets.chomp.upcase.split(""))
    check_valid_seq(seq)
  end

  def check_valid_seq(seq)
    until valid_seq?(seq)
      puts display_invalid_sequence
      seq = get_seq
    end
    seq
  end

  def valid_seq?(seq)
    valid_colors = "ROYGBV"
    if seq.nil? || seq.colors.length != 4 || seq.colors.any? { |color| !valid_colors.include?(color) }
      return false
    end
    true
  end

  def turn
    print display_turn_prompt
    guessed_seq = get_seq
    board.add_sequence(guessed_seq)
    board.display
    guessed_seq
  end
end