require 'spec_helper.rb'

RSpec.describe Board do

  let (:board) { Board.new }
  
  describe '#initialize' do
    it 'exists' do
      expect(board).to be_instance_of(Board)
    end

    it 'creates a board when initialized' do
      expect(board.visual).to be_instance_of(Hash)
    end
  end

  describe '#print_board' do
    it 'prints the board to terminal' do
      expect(board.print_visual).to be_instance_of(String)
    end
  end

	describe '#update_board' do
		it 'takes in a column and updates the array associated with that column' do
			player = Player.new("Billy")
			board.update_board("A", player)
			expect(board.visual["A"][0]).to eq "X"
		end

		it 'can accept multiple pieces in the same column and update board' do
			player = Player.new("Billy")
			board.update_board("A", player)
			board.update_board("A", player)

			expect(board.visual["A"][0]).to eq "X"
			expect(board.visual["A"][1]).to eq "X"
		end

	end

end