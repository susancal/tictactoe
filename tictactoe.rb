class Board
	attr_reader :board

	def initialize
		@board = ["-",".","-",".","*",".","-",".","-"]
		@player = "human"
	end

	def winner?
		(@board[0] == @board[1] && @board[1] == @board[2]) || (@board[3] == @board[4] && @board[4] == @board[5]) || (@board[6] == @board[7] && @board[7] == @board[8]) || (@board[0] == @board[4] && @board[4] == @board[8]) || (@board[2] == @board[4] && @board[4] == @board[6]) || (@board[0] == @board[3] && @board[3] == @board[6]) || (@board[1] == @board[4] && @board[4] == @board[7]) || (@board[2] == @board[5] && @board[5] == @board[8]) 
	end

	def print_board
		puts "#{@board[0]} #{@board[1]} #{@board[2]}"
		puts "#{@board[3]} #{@board[4]} #{@board[5]}"
		puts "#{@board[6]} #{@board[7]} #{@board[8]}"
	end

	def start_game
		until winner? || full_board?
			print_board
			puts "Place your X (0-8)"
			input = gets.chomp.to_i
			@player = "human"
			until input < 9 && @board[input] != "X" && @board[input] != "O"
				puts "That space is already taken. Try again loser!"
				input = gets.chomp.to_i
			end
			@board[input] = "X"
			computer_input if !winner? && !full_board?
		end
		display_winner
	end

	def computer_input
		@player = "computer"
		input = rand(0..8)
		until @board[input] != "X" && @board[input] != "O"
			input = rand(0..8)
		end
		@board[input] = "O"
	end

	def display_winner
		if winner?
			if @player == "computer"
				print_board
				puts "You lost!"
			elsif @player == "human"
				print_board
				puts "You won!"
			end
		else
			puts "It was a tie!"
		end
	end

	def full_board?
		!@board.include?("-") && !@board.include?(".") && !@board.include?("*")
	end

end

game = Board.new

game.start_game