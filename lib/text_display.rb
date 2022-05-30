require_relative 'display.rb'

module TextDisplay
  include Display
  def display_start
    <<-HEREDOC


      #{format("underline", "How to play Mastermind:")}

      This is a 1-player game against the computer.
      You can choose to be the code #{format("underline", "maker")} or the code #{format("underline", "breaker")}.

      There are six different color options: RCYGBM

      #{code_colors("R")}#{code_colors("C")}#{code_colors("Y")}#{code_colors("G")}#{code_colors("B")}#{code_colors("M")}


      The code maker will choose four to create a 'master code'. For example,

      #{code_colors("B")}#{code_colors("C")}#{code_colors("M")}#{code_colors("R")}

      There can be multiple slots of of the same color, but blanks are not allowed.
      In order to win, the code breaker needs to guess the 'master code' in 12 or less turns.


      #{format("underline", "Clues:")}
      After each guess, there will be up to four clues to help crack the code.

       #{clue_colors("*")}This clue means you have 1 correct color in the correct location.

       #{clue_colors("?")}This clue means you have 1 correct color, but in the wrong location.


      #{format("underline", "Clue Example:")}
      To continue the example, using the above 'master code' a guess of "RGMY" would produce 3 clues:
      **FORMAT THIS CORRECTLY LATER**

      #{code_colors("R")}#{code_colors("G")}#{code_colors("M")}#{code_colors("Y")}  Clues: #{clue_colors("*")}#{clue_colors("?")}#{clue_colors("?")}


      The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location.

      #{format("underline", "It's time to play!")}
      Would you like to be the code MAKER or code BREAKER?

      Press '1' to be the code MAKER
      Press '2' to be the code BREAKER
    HEREDOC
  end

  def display_codemaker_prompt
    <<-HEREDOC
    Codemaker - Enter a code consisting of four color characters (eg. RCYG)
    Possible colors: R (Red), C (Cyan), Y (Yellow), G (Green), B (Blue), M (Magenta)
    Your code:
    HEREDOC
  end

  def display_turn_prompt
    "Codebreaker - enter a guess consisting of four color characters (eg. RCYG) or type 'q' to quit: "
  end

  def display_cb_win
    format("underline", "Guess correct! Codebreaker wins!")
  end

  def display_cm_win
    "Final guess incorrect! Codemaker wins!"
  end

  def display_invalid_sequence
    "Color sequence is invalid. Try again with the possible colors (RCYGBM) or type 'q' to quit:"
  end

  def display_tf
    "Thanks for playing!"
  end

  def display_invalid_game_type
    "Enter '1' to be the code MAKER or '2' to be the code BREAKER"
  end

  def clear
    if Gem.win_platform?
      system "cls"
    else
      system "clear"
    end
  end

  def format_test
    "\e[4mHello\e[0m"
  end
end
