module Display
  def display_codemaker_prompt
    <<-HEREDOC
    Codemaker - Enter a code consisting of four color characters (eg. BRRG)
    Possible colors: B (Blue), R (Red), O (Orange), W (White), G (Green), P (Purple)
    Your code: 
    HEREDOC
  end

  def display_turn_prompt
    "Enter a guess consisting of four color characters (eg. BRRG): "
  end

  def display_cb_win
    "Guess correct! Codebreaker wins!"
  end

  def display_cm_win
    "Final guess incorrect! Codemaker wins!"
  end
end