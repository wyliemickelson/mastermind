require_relative 'Peg.rb'

class Sequence
  attr_reader :pegs
  def initialize(pegs = Array.new)
    @pegs = pegs
  end

  def add_peg(peg)
    @pegs << peg
  end

  def to_s
    if pegs.empty?
      return "|   |   |   |   |"
    end
    "| #{pegs[0]} | #{pegs[1]} | #{pegs[2]} | #{pegs[3]} |"
  end
end