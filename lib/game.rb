class Game
  attr_reader :current_player

  def initialize(board)
    @board = board
    @current_player = nil
  end
end