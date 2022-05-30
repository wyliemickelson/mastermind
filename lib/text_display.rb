module TextDisplay
  def display_start
    <<-HEREDOC


      #{formatting('underline', 'How to play Mastermind:')}

      This is a 1-player game against the computer.
      You can choose to be the code #{formatting('underline', 'maker')} or the code #{formatting('underline', 'breaker')}.

      There are six different number/color combinations:

      #{code_colors('1')}#{code_colors('2')}#{code_colors('3')}#{code_colors('4')}#{code_colors('5')}#{code_colors('6')}


      The code maker will choose four to create a 'master code'. For example,

      #{code_colors('1')}#{code_colors('3')}#{code_colors('4')}#{code_colors('1')}

      As you can see, there can be #{formatting('red', 'more then one')} of the same number/color.
      In order to win, the code breaker needs to guess the 'master code' in 12 or less turns.


      #{formatting('underline', 'Clues:')}
      After each guess, there will be up to four clues to help crack the code.

       #{clue_colors('*')}This clue means you have 1 correct number in the correct location.

       #{clue_colors('?')}This clue means you have 1 correct number, but in the wrong location.


      #{formatting('underline', 'Clue Example:')}
      To continue the example, using the above 'master code' a guess of "1463" would produce 3 clues:

      #{code_colors('1')}#{code_colors('4')}#{code_colors('6')}#{code_colors('3')}  Clues: #{clue_colors('*')}#{clue_colors('?')}#{clue_colors('?')}


      The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location.

      #{formatting('underline', "It's time to play!")}
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
    "Codebreaker - enter a guess consisting of four color characters (eg. RCYG): "
  end

  def display_cb_win
    "Guess correct! Codebreaker wins!"
  end

  def display_cm_win
    "Final guess incorrect! Codemaker wins!"
  end

  def display_invalid_sequence
    "Color sequence is invalid. Try again with the possible colors: (RCYGBM)"
  end

  def clear
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
  end
end