require './spec_helper.rb'

RSpec.describe Board do
  let (:board) { Board.new }
  describe '#initialize' do
    it 'exists' do
      expect(board).to be_instance_of(Board)
    end
  end
end