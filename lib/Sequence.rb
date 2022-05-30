class Sequence
  attr_reader :colors
  def initialize(colors = Array.new)
    @colors = colors
  end

  def add_color(color)
    @colors << color
  end

  def to_s
    "| #{colors[0]} | #{colors[1]} | #{colors[2]} | #{colors[3]} |"
  end

  def equal?(seq)
    colors.to_s == seq.colors.to_s
  end
end