module GameLogic
  def compare(code, guess)
    temp_code = code.clone
    temp_guess = guess.clone
    @exact_num = exact_matches(temp_code, temp_guess)
    @same_num = same_matches(temp_code, temp_guess)
  end
end