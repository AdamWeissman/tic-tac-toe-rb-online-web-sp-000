def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

def input_to_index(num)
  index = num.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O" 
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Pick a number between 1 and 9: "
  num = gets.strip
  index = input_to_index(num)
  if valid_move?(board, index)
    move(board, index, token = "X")
  else
    puts "Invalid move."
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  counter += board.count("X") 
  counter += board.count("O")
  return counter
end

def current_player(board)
  turn_count(board).next.odd? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.none?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

#def winner(board)
#  if someone_won = won?(board)
#    return board[someone_won[0]]
#  end
#end

def winner(board)
  (board[won?(board)[0]] != nil) ? board[won?(board)[0]]) : nil 
end

#def winner(board)  NAMEERROR
#  board[someone_won[0]] if someone_won = won?(board)
#end



