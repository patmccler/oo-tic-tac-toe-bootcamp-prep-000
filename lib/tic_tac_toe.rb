
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #bot row
    [0,3,6], #left col
    [1,4,7], #mid col
    [2,4,8], #bot col
    ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    input = input.to_i
    input.between?(1,9) ? input - 1 : -1
  end

  position_taken?(index)
    !(@board[index].nil? || @board[index] == " " || @board[index] == "")
  end

  def valid_move(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    used_squares = @board.reject do |position|
      position == "" || position == " " || position.nil?
    end
    turn_count.size
  end

  def current_player
    turn_count % 2 == 1 ? "X" : "0"
  end

  def turn
      until good_move
      puts "Choose a move by entering 1-9"
      index = input_to_index(gets.strip)
      good_move = valid_move(index)
    end    
      move(index, current_player)
      display_board
  end

  def move(index, element)
    @board[index] = element
  end

  def won?
    WIN_COMBINATIONS.detect do |win_con|
      @board[win_con[0]] == @board[win_con[0] && @board[win_con[0]]== @board[win_con[0]] && position_taken?(@board[win_con[0]])
    end
  end

end
