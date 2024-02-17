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

  describe '#take_turn' do
    it 'does a lot' do
      # 
    end
  end

  describe '#create_players' do
    it 'can create two player objects' do
      players = game.create_players
      #require 'rspec'; binding.pry
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
end