require 'spec_helper.rb'

RSpec.describe Game do

  let (:game) {Game.new}

  describe '#initialize' do
    it 'exists' do
      expect(game).to be_instance_of(Game)
    end

    it 'has two players by default' do
      expect(game.players[0].name).to eq("Player")
      expect(game.players[1].name).to eq("Computer")
    end
  end

  describe '#computer_take_turn' do
    it 'can choose a valid column' do
      valid_column = game.computer_take_turn

      expect(%w[A B C D E F G]).to include(valid_column)
    end

    it 'can only choose a column that is not full' do
      player = Player.new("Billy")

      6.times do
        game.board.update_board("A", player)
        game.board.update_board("B", player)
        game.board.update_board("C", player)
        game.board.update_board("D", player)
        game.board.update_board("F", player)
        game.board.update_board("G", player)
      end

      expect(game.computer_take_turn).to eq("E")
      expect(game.computer_take_turn).to eq("E")
      expect(game.computer_take_turn).to eq("E")
    end
  end

  describe '#create_players' do
    it 'can create two player objects' do
      players = game.create_players

      expect(players[0]).to be_instance_of(Player)
      expect(players[1]).to be_instance_of(Player)
    end
  end

  describe '#current_player' do
    it 'has a current_player' do 
      game.create_players

      expect(game.current_player.name).to eq('Player')
    end
  end

  describe '#change_current_player' do
    it 'changes the current player' do
      game.create_players

      expect(game.current_player.name).to eq('Player')

      game.change_current_player

      expect(game.current_player.name).to eq('Computer')
    end
  end

  describe '#is_valid?' do
    it 'can check if the input is a valid column and if the column is not full' do
      expect(game.is_valid?("H")).to be false
      expect(game.is_valid?("A")).to be true

      player = Player.new("Billy")
      game.board.update_board("B", player)
      game.board.update_board("B", player)
      game.board.update_board("B", player)

      expect(game.is_valid?("B")).to be true

      game.board.update_board("B", player)
      game.board.update_board("B", player)
      game.board.update_board("B", player)

      expect(game.is_valid?("B")).to be false
    end

    it 'can check if the input is a valid column' do
      expect(game.is_valid_column?("H")).to be false

      expect(game.is_valid_column?("G1")).to be false

      expect(game.is_valid_column?("A")).to be true
    end

    it 'can check if the chosen column is full' do
      player = Player.new("Billy")
      game.board.update_board("A", player)
      game.board.update_board("A", player)
      game.board.update_board("A", player)

      expect(game.is_column_full?("A")).to be false

      game.board.update_board("A", player)
      game.board.update_board("A", player)
      game.board.update_board("A", player)

      expect(game.is_column_full?("A")).to be true
    end
  end

  describe '#check_for_draw?' do
    it 'can check if there is a draw' do
      42.times {game.add_to_turn_count}

      expect(game.check_for_draw?).to be false
      
      game.add_to_turn_count
      
      expect(game.check_for_draw?).to be true
    end
  end

  describe '#win?' do
    it 'can win by connecting 4 of the same piece vertically' do
      game.board.update_board("A", game.current_player)

      expect(game.vertical_win?).to be false

      game.board.update_board("A", game.current_player)
      game.board.update_board("A", game.current_player)

      expect(game.vertical_win?).to be false

      game.board.update_board("A", game.current_player)

      expect(game.vertical_win?).to be true
    end

    it 'can win by connecting 4 of the same piece horizontally' do
      game.board.update_board("A", game.current_player)

      expect(game.horizontal_win?).to be false

      game.board.update_board("B", game.current_player)
      game.board.update_board("D", game.current_player)

      expect(game.horizontal_win?).to be false

      game.board.update_board("C", game.current_player)

      expect(game.horizontal_win?).to be true
    end

    it 'can win by connecting 4 of the same piece diagonally from sw to ne' do
      game.board.update_board("A", game.current_player)

      expect(game.sw_to_ne_diagonal_win?).to be false

      game.board.update_board("B", game.current_player)

      expect(game.sw_to_ne_diagonal_win?).to be false

      game.board.update_board("C", game.current_player)
      game.board.update_board("C", game.current_player)
      game.board.update_board("C", game.current_player)
      game.board.update_board("D", game.current_player)

      expect(game.sw_to_ne_diagonal_win?).to be false

      game.board.update_board("D", game.current_player)
      game.board.update_board("D", game.current_player)
      game.board.update_board("D", game.current_player)

      expect(game.sw_to_ne_diagonal_win?).to be false

      game.board.update_board("B", game.current_player)

      expect(game.sw_to_ne_diagonal_win?).to be true
    end

    it 'can win by connecting 4 of the same piece diagonally from se to nw' do
      game.board.update_board("G", game.current_player)

      expect(game.se_to_nw_diagonal_win?).to be false

      game.board.update_board("F", game.current_player)

      expect(game.se_to_nw_diagonal_win?).to be false

      game.board.update_board("E", game.current_player)
      game.board.update_board("E", game.current_player)
      game.board.update_board("E", game.current_player)
      game.board.update_board("D", game.current_player)

      expect(game.se_to_nw_diagonal_win?).to be false

      game.board.update_board("D", game.current_player)
      game.board.update_board("D", game.current_player)
      game.board.update_board("D", game.current_player)

      expect(game.se_to_nw_diagonal_win?).to be false

      game.board.update_board("F", game.current_player)

      expect(game.se_to_nw_diagonal_win?).to be true
    end
  end

  describe "#reset_game" do
    it 'can reset the board' do
        game.board.update_board("A", game.current_player)
        game.board.update_board("E", game.current_player)
        game.board.update_board("E", game.current_player)

        expect(game.board.visual["A"][0]).to eq "X"
        expect(game.board.visual["E"][0]).to eq "X"
        expect(game.board.visual["E"][1]).to eq "X"

        game.reset_game

        expect(game.board.visual["A"][0]).to eq "."
        expect(game.board.visual["E"][0]).to eq "."
        expect(game.board.visual["E"][1]).to eq "."     
    end 

    it 'can reset the turns taken' do
      game.add_to_turn_count

      expect(game.turns_taken).to eq 1

      game.reset_game

      expect(game.turns_taken).to eq 0     
    end 
  end

  describe '#add_to_turn_count' do
    it 'adds to turns_taken' do
      expect(game.turns_taken).to eq 0 

      game.add_to_turn_count
      game.add_to_turn_count
      game.add_to_turn_count

      expect(game.turns_taken).to eq 3
    end
  end
end