require_relative './user_interface'
# Engine
class Engine
  attr_accessor :board
  # add game logic
  def initialize
    @wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
             [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
             game = TicTacToe.new  
             board = game.board
  end

  def display(board)
    # @pos = positions_with_values
    puts @grid = "
        #{board[0]}|#{board[1]}|#{board[2]}
        -----
        #{board[3]}|#{board[4]}|#{board[5]}
        -----
        #{board[6]}|#{board[7]}|#{board[8]}"
  end

  def indexing(user_input)
    user_input.to_i - 1
  end

  def move(board, index, current_player)
    board[index] = current_player
  end

  def valid_move?(_array, index)
    if index < 0 || index > 8 || index.nil?
      false
    else
      true
    end
  end

  def turn(board)
    puts 'Please enter 1-9:'
    input = gets.strip
    index = indexing(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display(board)
    else
      turn(board)
    end
  end

  def turn_count(array)
    counter = 0
    array.each do |move|
      counter += 1 if move == 'X' || move == 'O'
    end
    counter
  end

  def current_player(board)
    if turn_count(board).even? == true
      'X'
    else
      'O'
    end
  end

  def win?(board)
    @wins.each do |win_combination|
      win_1 = win_combination[0]
      win_2 = win_combination[1]
      win_3 = win_combination[2]
      pos_1 = board[win_1]
      pos_2 = board[win_2]
      pos_3 = board[win_3]
      if (pos_1 == 'X' && pos_2 == 'X' && pos_3 == 'X') ||
         (pos_1 == 'O' && pos_2 == 'O' && pos_3 == 'O')
        return win_combination
      end
    end
    nil
  end

  def full?(array)
    count = 0
    array.each do |move|
      count += 1 if move == 'X' || move == 'O'
    end
    if count == 9
      return true
    else
      return false
    end
  end

  def draw?(array)
    if full?(array) && !win?(array)
      true
    else
      false
    end
  end

  def over?(array)
    if win?(array) || draw?(array) || full?(array)
      true
    else
      false
    end
  end

  def winner(array)
    if win?(array)
      @wins.each do |win_combination|
        pos_1 = array[win_combination[0]]
        pos_2 = array[win_combination[1]]
        pos_3 = array[win_combination[2]]
        if pos_1 == 'X' && pos_2 == 'X' && pos_3 == 'X'
          return 'X'
        elsif pos_1 == 'O' && pos_2 == 'O' && pos_3 == 'O'
          return 'O'
        end
      end
    end
  end

  def play(board)
    turn(board) until over?(board)
    if win?(board)
      puts 'Congratulations ' + winner(board) + '!'
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end

end

