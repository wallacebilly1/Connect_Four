class Message
  def welcome
    banner = File.read("lib/title_image.txt")
    "Welcome to...\n #{banner} \n \nEnter p to play, enter q to quit."
  end

  def invalid_command
    "Invalid command. Please enter either 'p' or 'q'"
  end

  def choose_column
    "Please choose a column (A-G) to place your piece."
  end

  def current_player_turn(player)
    "It is currently #{player}'s turn."
  end

  def last_piece_played(last_piece)
    "The last piece was played in column #{last_piece[0]}"
  end

  def choose_again
    "That is not a valid placement. Please choose again."
  end

  def win(player)
    "Congratulations, #{player.name}! You are the CONNECT FOUR champion!\n\n\n\n\n"
  end

  def draw
    "There are no more valid placements. This game is a draw."
  end
end