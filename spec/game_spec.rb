require 'spec_helper.rb'

RSpec.describe Game do

  let (:game) {Game.new(Board.new)}

  describe '#initialize' do
    it 'exists' do
      expect(game).to be_instance_of(Game)
    end

    it 'has no current_player by default' do
      expect(game.current_player).to be nil
    end
  end
end