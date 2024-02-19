class Game
  attr_reader :players, :board

  def initialize
    @board = Board.new
    @players = create_players
    @message_bot = Message.new
    @turns_taken = 0
  end

  def start
    puts @message_bot.welcome
    play = true   
    answer = gets.chomp.downcase
        if answer == 'q'
            play = false
        elsif answer == 'p'
            play
        else
          puts @message_bot.invalid_command
          answer = gets.chomp.downcase
        end    
    while play
        puts @board.print_visual
        take_turn
        win?
        change_current_player
        # Move later bros
        puts @message_bot.last_piece_played(@board.last_piece_played)
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
    @turns_taken += 1
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
    # sleep(2)
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

  def is_valid?(input)
    is_valid_column?(input) && !is_column_full?(input)
  end
  
  def is_valid_column?(input)
    %w[A B C D E F G].include?(input)
  end
  
  def is_column_full?(input)
    @board.visual[input].none?(".")
  end

  def se_to_nw_diagonal_win?
    count = 1
    temp_last_piece = [@board.last_piece_played[0].ord, @board.last_piece_played[1]]
    if temp_last_piece[0] > 65
      while @board.visual[(temp_last_piece[0] -= 1).chr][temp_last_piece[1] += 1] == current_player.piece
          count += 1
          break if temp_last_piece[0] == 65
      end
    end

    temp_last_piece = [@board.last_piece_played[0].ord, @board.last_piece_played[1]]
    if temp_last_piece[0] < 71
      while @board.visual[(temp_last_piece[0] += 1).chr][temp_last_piece[1] -= 1] == current_player.piece
        count += 1
        break if temp_last_piece[0] == 71
      end
    end
    return true if count >= 4
    false
  end
end