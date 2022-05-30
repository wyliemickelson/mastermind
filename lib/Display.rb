module Display

  def get_color(color)
    {
      "R" => "\e[30;41m R \e[0m ",
      "C" => "\e[30;46m C \e[0m ",
      "Y" => "\e[30;103m Y \e[0m ",
      "G" => "\e[30;42m G \e[0m ",
      "B" => "\e[30;44m B \e[0m ",
      "M" => "\e[30;45m M \e[0m "
    }[color]
  end
end