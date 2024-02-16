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
  end

	describe '' do
		it ' ' do
			
		end
	end

end