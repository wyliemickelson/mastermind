require_relative "display.rb"

class Sequence
  include Display
  attr_reader :colors, :hints

  def initialize(colors = Array.new, hints = Array.new)
    @colors = colors
    @hints = hints
  end

  def add_color(color)
    @colors << color
  end

  def add_hint(hint)
    @hints << hint
  end

  def empty?
    colors.all? { |color| color.nil? || color == ""}
  end

  def to_s
    color_s = colors.reduce("|") { |s, color| s += " #{code_colors(color)}|" }
    hint_s = hints.reduce("|") { |s, hint| s += " #{hint} |" }
    "#{color_s} Clues: #{hint_s}"
  end

  def equal?(seq)
    colors.to_s == seq.colors.to_s
  end
end
