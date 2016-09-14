class Board
	attr_reader :board

	def initialize
		@board = ["-",".","-",".","-",".","-",".","-"]
	end

	def check_winner
		(@board[0] == @board[1] && @board[1] == @board[2]) || (@board[3] == @board[4] && @board[4] == @board[5]) || (@board[6] == @board[7] && @board[7] == @board[8]) || (@board[0] == @board[4] && @board[4] == @board[8]) || (@board[2] == @board[4] && @board[4] == @board[6]) || (@board[0] == @board[3] && @board[3] == @board[6]) || (@board[1] == @board[4] && @board[4] == @board[7]) || (@board[2] == @board[5] && @board[5] == @board[8]) 
	end

	def print_board
		p @board[0..2]
	end
end

game = Board.new

p game.check_winner
game.print_board