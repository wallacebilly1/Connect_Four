require "./lib/game_rules"

class Game
  include GameRules
  attr_reader :players, :board, :turns_taken

  def initialize
    @board = Board.new
    @players = create_players
    @message_bot = Message.new
    @turns_taken = 0
  end

  def start
    puts @message_bot.welcome
    play = false   
    answer = gets.chomp.downcase
    until play
      if answer == 'q'
        exit
      elsif answer == 'p'
        play = true
      else
        puts @message_bot.invalid_command
        answer = gets.chomp.downcase
      end
    end
    puts @board.print_visual
    while play
      take_turn
      puts @message_bot.last_piece_played(@board.last_piece_played)
      puts @board.print_visual
      game_over
      change_current_player
    end
  end

  def take_turn
    puts "-----------------------------------------"
    puts @message_bot.current_player_turn(current_player.name)
    column_choice =
    if current_player.name == "Player"
        player_take_turn
    else
        computer_take_turn
    end
    @board.update_board(column_choice, current_player)
    add_to_turn_count
  end

  def player_take_turn
    answer = false
    column_choice = nil
    while answer == false do
      puts @message_bot.choose_column
      column_choice = current_player.choose_column.upcase
      answer = is_valid?(column_choice)  
    end
    column_choice
  end

  def computer_take_turn
    sleep(2)
    %w[A B C D E F G].select do |column|
      is_valid?(column)
    end.sample
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

  def game_over
    if check_for_draw?
      puts @message_bot.draw
      sleep(5)
      reset_game
      start
    elsif win?
      puts @message_bot.win(current_player)
      sleep(5)
      reset_game
      start
    end
  end

  def reset_game
    @board = Board.new
    @turns_taken = 0
    @players = create_players
  end

  def add_to_turn_count
    @turns_taken += 1
  end
end