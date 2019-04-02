# Player has players information
# Player has name, symbol, winner and moves methods
class Player
  attr_accessor :winner, :moves

  def initialize(name, symbol, winner)
    @name = name
    @symbol = symbol
    @winner = winner
    @moves = []
  end

  def name
    name = @name
    name
  end

  def symbol
    symbol = @symbol
    symbol
  end
end
