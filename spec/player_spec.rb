require 'spec_helper.rb'

RSpec.describe Player do

  let (:player) { Player.new }

  describe '#initialize' do
    it 'exists' do
      expect(player).to be_instance_of(Player)
    end

    it 'starts with "computer" as the player name' do
      expect(player.name).to eq "Computer"
    end

    it 'can change the name when initialized with a name' do
      player = Player.new("Jared")
      expect(player.name).to eq "Jared"
    end

    it 'starts with "O" as the default piece' do
      expect(player.piece).to eq "O"
    end
  end

  describe '#choose_piece' do
    it 'can change piece to "X" if player name is not "Computer"' do
      player = Player.new("Grant")
      expect(player.piece).to eq "X"
    end
  end
end