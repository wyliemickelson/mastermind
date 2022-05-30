require_relative "text_display.rb"

class Game
  include TextDisplay

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
    puts display_start
    get_game_type
    create_code
  end

  def get_game_type
    type = gets.chomp
    until valid_game_type?(type)
      puts display_invalid_game_type
      type = gets.chomp
    end
  end

  def valid_game_type?(type)
    valid_types = "12"
    valid_types.include?(type) && type != ""
  end

  def game_over?
    if curr_guess.equal?(board.code)
      puts display_cb_win
      return true
    elsif board.sequences.length == 12
      puts display_cm_win
      return true
    elsif curr_guess == "q"
      puts display_tfp
      return true
    end
    false
  end

  def create_code
    print display_codemaker_prompt.chomp
    code = get_guess
    @board.code = code
  end

  def get_guess
    guess = Sequence.new(gets.chomp.upcase.split(""))
    until valid_guess?(guess)
      puts display_invalid_sequence
      guess = Sequence.new(gets.chomp.upcase.split(""))
    end
    guess
  end
  
  def valid_guess?(guess)
    valid_colors = "RCYGBM"
    if guess.nil? || guess.empty?
      return false
    end
    if guess.colors[0].downcase == 'q'
      return true
    end
    if guess.colors.length != 4 || guess.colors.any? { |color| !valid_colors.include?(color) }
      return false
    end
    true
  end

  def turn
    print display_turn_prompt
    guessed_seq = get_guess
    board.add_sequence(guessed_seq)
    clear
    board.display
    guessed_seq
  end
end
