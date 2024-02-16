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
end