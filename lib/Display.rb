module Display
  def display_codemaker_prompt
    <<-HEREDOC
    Codemaker - Enter a code consisting of four color characters (eg. BRGY)
    Possible colors: R (Red), O (Orange), Y (Yellow), G (Green), B (Blue), V(Violet)
    Your code: 
    HEREDOC
  end

  def display_turn_prompt
    "Codebreaker - enter a guess consisting of four color characters (eg. ROYB): "
  end

  def display_cb_win
    "Guess correct! Codebreaker wins!"
  end

  def display_cm_win
    "Final guess incorrect! Codemaker wins!"
  end

  def display_invalid_sequence
    "Color sequence is invalid. Try again with the possible colors: (ROYGBV)"
  end
end