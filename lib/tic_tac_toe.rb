class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[2,4,6]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{ |a| a == "X" || a == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    cp = current_player
    puts "Player #{cp}, please select a number, 1-9."
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      @board[index] = cp
      display_board
    else
      turn
    end
  end
  
  def won?
    a =  WIN_COMBINATIONS.find { |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find { |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    a || b ? (a || b) : false
  end
  
  def full?
    !@board.any?{|pos| pos == "" || pos == " "}
  end
      
  def draw?
    !won? && full?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play
    while over? == false
      turn
    end
    
    if winner != nil
      puts "Congratulations player #{winner}!"
    elsif draw? == true
      puts "Cat's Gmae!"
    else
      turn
    end
    
  end
    
end
















#class TicTacToe
#  
#  def initialize(board = nil)
#    @board  = board || Array.new(9, " ")
#  end
#  
#  def play
#    @board = Array.new(9, " ")
#    turn until over?
#    won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
#    puts "Would you like to play again? (Y or N)"
#    gets.strip.downcase == "y" || gets.strip.downcase == "yes" ? play : puts("Goodbye!") 
#  end
#  
#  def turn
#    puts "Player #{current_player}, please enter a number 1-9:"
#    input = gets.strip
#    index = input_to_index(input)
#    cp = current_player
#    if valid_move?(index)
#      move(index, cp)
#      display_board
#    else
#      turn
#    end
# end
#  
# def input_to_index(input)
#    input.to_i - 1
#  end
#  
#  def valid_move?(index)
#    index.between?(0,8) && !position_taken?(index)
#  end
#  
#  def position_taken?(index)
#    !(@board[index].nil? || @board[index] == " ")
#  end
#  
#  def move(index, token = "X")
#    @board[index] = token
#  end
#  
#  def current_player
#    turn_count % 2 == 0 ? "X" : "O"
#  end
#  
#  def turn_count
#    @board.count {|token| token == "X" || token == "O"}
#  end
#  
#  def display_board
#    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#    puts "-----------"
#    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#    puts "-----------"
#    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#  end
#  
#  def over?
#    won? || draw?
#  end
#  
#  def won?
#    a = WIN_COMBINATIONS.find{
#      |combo|
#      @board[combo[0]] == "X" && @board[combo[1]] == "X"  && @board[combo[2]] == "X"
#    }
#    b = WIN_COMBINATIONS.find{
#      |combo|
#      @board[combo[0]] == "O" && @board[combo[1]] == "O"  && @board[combo[2]] == "O"
#    }
#    return a || b
#  end
#  
#  WIN_COMBINATIONS = [
#    [0,1,2], # Row.T
#    [0,4,8], # Dia.L Top-left to bottom-right
#    [0,3,6], # Col.L
#    [1,4,7], # Col.M
#    [2,4,6], # Dia.R
#    [2,5,8], # Col.R
#    [3,4,5], # Row.M
#    [6,7,8] # Row.B
#  ]
#  
#  def draw?
#    !won? && full?
#  end
#  
#  def full?
#    !@board.any?{|a| a == "" || a == " "}
#  end
#  
#  def winner
#    if won?
#      @board[won?[0]] == "X" ? "X" : "O"
#    else
#      nil
#    end
#  end
#  
#  
#end






