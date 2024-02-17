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
    answer = false
    until answer == true do
      puts @message_bot.choose_column        
      column_choice = current_player.choose_column.upcase
      # checks to see if the user input is valid
      answer = is_valid?(column_choice)        
    end

    # if valid, applies input to board
    @board.update_board(column_choice, current_player)
    @board.print_visual

    # once input is placed, checks for win conditions

    # changes current_player
    change_current_player
    # loop    
    take_turn
  end

  def create_players
    [Player.new('Player'), Player.new]
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