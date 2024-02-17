class Game
  attr_reader :players, :board

  def initialize
    @board = Board.new
    @players = create_players
    @message_bot = Message.new
  end

  def take_turn
    # says whose turn it is
    puts @message_bot.current_player_turn(current_player.name)
    # prints current state of board
    puts @board.print_visual
    # requests a column
    puts @message_bot.choose_column
    column_choice = current_player.choose_column.upcase
    # checks to see if the user input is valid
    is_valid?(column_choice)
    # if valid, applies input to board
    # once input is placed, checks for win conditions
    # changes current_player
    # loop
  end

  def create_players
    [Player.new('Player'), Player.new]
    # @players << Player.new('Player')
    # @players << Player.new
  end

  def current_player
    @players[0]
  end

  def change_current_player
    @players.rotate!
  end

  def is_valid?(input)
    is_valid_column?(input) && !is_column_full?(input)
  end

  def is_valid_column?(input)
		%w[A B C D E F G].include?(input)
	end

  def is_column_full?(input)
    @board.visual[input].none?(".")
  end
end