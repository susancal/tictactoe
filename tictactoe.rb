class Board

	def initialize
		@board = ["-",".","-",".","-",".","-",".","-"]
	end

	def check_winner
		(@board[0] == @board[1] && @board[1] == @board[2]) || (@board[3] == @board[4] && @board[4] == @board[5])
	end

end

game = Board.new

p game.check_winner