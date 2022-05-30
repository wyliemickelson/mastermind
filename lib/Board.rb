require_relative 'Sequence.rb'

class Board
  attr_reader :sequences
  attr_accessor :code

  def initialize(sequences = Array.new)
    @sequences = sequences
    @code = Sequence.new 
  end

  def add_sequence(seq)
    @sequences.unshift(seq)
  end

  def display
    sequences.each_with_index do |seq, index| 
      spaces = " " if index < 9
      puts "Guess #{index + 1}: #{spaces}#{seq}\n--------------------------"
    end
  end
end