class Game
  attr_reader :players, :board

  def initialize
    @board = Board.new
    @players = []
    @message_bot = Message.new
  end

  def take_turn
    # says whose turn it is
    @message_bot.current_player_turn(current_player)
    # prints current state of board
    # requests a column
    # checks to see if the user input is valid
    # if valid, applies input to board
    # once input is placed, checks for win conditions
    # changes current_player
    # loop
  end

  def create_players
    @players << Player.new('Player')
    @players << Player.new
  end

  def current_player
    @players[0]
  end

  def change_current_player
    @players.rotate!
  end

  def is_valid_column?(input)
		%w[A B C D E F G].include?(input)
	end

  def is_column_full?(input)
    @board.visual[input].none?(".")
  end
end