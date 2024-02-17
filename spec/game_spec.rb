require 'spec_helper.rb'

RSpec.describe Game do

  let (:game) {Game.new(Board.new)}

  describe '#initialize' do
    it 'exists' do
      expect(game).to be_instance_of(Game)
    end

    it 'has no players by default' do
      expect(game.players).to eq([])
    end
  end

  describe '#take_turn' do
    it 'does a lot' do
      # 
    end
  end

  describe '#create_players' do
    it 'can create two player objects with the names Player and Computer' do
      expect(game.players).to eq([])

      game.create_players

      expect(game.players[0].name).to eq ('Player')
      expect(game.players[1].name).to eq ('Computer')
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

  describe '#is_valid_column?' do
    it 'can check if the input is a valid column' do
      expect(game.is_valid_column?("H")).to be false

      expect(game.is_valid_column?("G1")).to be false

      expect(game.is_valid_column?("A")).to be true
    end
  end
end