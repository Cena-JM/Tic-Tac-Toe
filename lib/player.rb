# Player has players information
# Player has name, symbol, winner and moves methods
class Player
  attr_accessor :name, :symbol, :winner, :moves

  def initialize(name, symbol, winner)
    @name = name
    @symbol = symbol
    @winner = winner
    @moves = []
  end
end
