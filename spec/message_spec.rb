require 'spec_helper.rb'

RSpec.describe Message do

  let (:message) { Message.new }

  describe '#initialize' do
    it 'exists' do
      expect(message).to be_an_instance_of Message
    end
  end

  describe '#message methods' do
    it 'properly displays #welcome message' do
      expect(message.welcome).to be_an_instance_of String
    end

    it 'properly displays #invalid_command message' do
      expect(message.invalid_command).to be_an_instance_of String
    end

    it 'properly displays #choose_column message' do
      expect(message.choose_column).to be_an_instance_of String
    end

    it 'properly displays #current_player_turn message' do
      expect(message.current_player_turn("Player")).to be_an_instance_of String
    end

    it 'properly displays #last_piece_played message' do
      expect(message.last_piece_played("D4")).to be_an_instance_of String
    end

    it 'properly displays #choose_again message' do
      expect(message.choose_again).to be_an_instance_of String
    end

    it 'properly displays #win message' do
      player = Player.new("Billy")
      expect(message.win(player)).to be_an_instance_of String
    end

    it 'properly displays #draw message' do
      expect(message.draw).to be_an_instance_of String
    end
  end
end