# User interface
class UserInterface
  attr_accessor :ply1
  attr_accessor :ply2
  def intialize(ply1, ply2)
    @ply1 = ply1
    @ply2 = ply2
  end

  def p1_move(board, position, _engine)
    # player1 move
    board.positions_with_values[position] = ply1
    board.display
  end

  def p2_move(board, position, _engine)
    # player2 move
    board.positions_with_values[position] = ply2
    board.display
  end
end
# add game logic
