require_relative '../bin/user_interface'
# Engine
class Engine
  attr_accessor :board
  # add game logic
  def initialize
    puts 'Player1 enter your name?'
    @player1 = gets.chomp
    puts 'player2 enter your name?'
    @player2 = gets.chomp
    @wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
             [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  end

  def indexing(user_input)
    user_input.to_i - 1
  end

  def move(board, index, current_player)
    board[index] = current_player
  end

  def valid_move?(array, index)
    if index < 0 || index > 8 || index.nil?
      false
    elsif array[index] == ' ' || array[index] == ''
      true
    else
      false
    end
  end

  def turn(board)
    dp = TicTacToe.new
    if current_player(board) == 'X'
      puts "\n#{@player1} enter 1-9"
    else
      puts "#{@player2} enter 1-9"
    end
    input = gets.strip
    index = indexing(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      dp.display(board)
    else
      turn(board)
    end
  end

  def turn_count(array)
    counter = 0
    array.each do |move|
      counter += 1 if move.include?('X') || move.include?('O')
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
      w_a = win_combination[0]
      w_b = win_combination[1]
      w_c = win_combination[2]
      p_a = board[w_a]
      p_b = board[w_b]
      p_c = board[w_c]
      return win_combination if (p_a == 'X' && p_b == 'X' && p_c == 'X') ||
                                (p_a == 'O' && p_b == 'O' && p_c == 'O')
    end
    nil
  end

  def full?(array)
    count = 0
    array.each do |move|
      count += 1 if move.include?('X') || move.include?('O')
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

  def player(board)
    if winner(board) == 'X'
      @player1
    else
      @player2
    end
  end

  def play(board)
    turn(board) until over?(board)
    if win?(board)
      puts 'Congratulations ' + player(board) + '!'
    elsif draw?(board)
      puts 'Its a draw!'
    end
  end
end
