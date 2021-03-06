
#to run tests:  rspec spec/02_play_spec.rb

WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end  

def input_to_index(input)
  (input.to_i) - 1
end

def move(board,input_to_index, character)
  board[input_to_index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true 
  end  
end  

def valid_move?(board, index)
  if position_taken?(board,index) == false && index.between?(0,8)
    true
  else
    false  
  end  
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |n|
    if n == "O" || n == "X"
      count += 1
    end
  end
  count    
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end    
end  

def won?(board)
  WIN_COMBINATIONS.find do |combination|
    board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
    board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
  end
 end

def full?(board)
  board.all? {|value| value == "X" || value == "O"} 
end  

def draw?(board)
  !won?(board) && full?(board)  
end  

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end    
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
















