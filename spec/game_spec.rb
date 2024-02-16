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
end