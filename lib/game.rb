class Game
  attr_reader :players

  def initialize(board)
    @board = board
    @players = []
  end

  def take_turn
    # says whose turn it is
    # prints current state of board
    # requests a column
    # checks to see if the user input is valid
    # if valid, applies input to board
    # once input is placed, checks for win conditions
    # changes current_player
    # loop
  end
end