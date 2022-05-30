require_relative 'Board.rb'
require_relative 'Display.rb'

class Game
  include Display

  attr_reader :board
  def initialize
    @board = Board.new
  end

  def setup
    create_code
  end

  def create_code
    print display_codemaker_prompt.chomp
    # TODO - create input validation
    seq = gets.chomp.upcase.split(" ")
    @board.code = seq
  end
end

game = Game.new
game.setup