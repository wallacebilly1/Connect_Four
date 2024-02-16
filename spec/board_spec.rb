require 'spec_helper.rb'

RSpec.describe Board do
  let (:board) { Board.new }
  describe '#initialize' do
    it 'exists' do
      expect(board).to be_instance_of(Board)
    end

    it 'creates a board when initialized' do
      expect(board.board).to be_instance_of(Hash)
    end
  end

  describe '#print_board' do
    it 'prints the board to terminal' do
      expect(board.print_board).to be_instance_of(String)
    end
  end
end