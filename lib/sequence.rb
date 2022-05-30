require_relative "display.rb"

class Sequence
  include Display
  attr_reader :colors

  def initialize(colors = Array.new)
    @colors = colors
  end

  def add_color(color)
    @colors << color
  end

  def empty?
    colors.all? { |color| color.nil? || color == ""}
  end

  def to_s
    colors.reduce("|") { |s, color| s += " #{code_colors(color)}|" }
  end

  def equal?(seq)
    colors.to_s == seq.colors.to_s
  end
end
