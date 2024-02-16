require 'spec_helper.rb'

RSpec.describe Player do
	
	let (:player) { Player.new }

	describe '#initialize' do
    it 'exists' do
      expect(player).to be_instance_of(Player)
    end
  end

end