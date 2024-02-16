class Board
  attr_reader :board

  def initialize
    @board = {
      "A" => %w[. . . . . .],
      "B" => %w[. . . . . .],
      "C" => %w[. . . . . .],
      "D" => %w[. . . . . .],
      "E" => %w[. . . . . .],
      "F" => %w[. . . . . .],
      "G" => %w[. . . . . .]
    }
  end

  def print_board
    "
    A | B | C | D | E | F | G \n
    #{board["A"][5]} | #{board["B"][5]} | #{board["C"][5]} | #{board["D"][5]} | #{board["E"][5]} | #{board["F"][5]} | #{board["G"][5]}
    #{board["A"][4]} | #{board["B"][4]} | #{board["C"][4]} | #{board["D"][4]} | #{board["E"][4]} | #{board["F"][4]} | #{board["G"][4]}
    #{board["A"][3]} | #{board["B"][3]} | #{board["C"][3]} | #{board["D"][3]} | #{board["E"][3]} | #{board["F"][3]} | #{board["G"][3]}
    #{board["A"][2]} | #{board["B"][2]} | #{board["C"][2]} | #{board["D"][2]} | #{board["E"][2]} | #{board["F"][2]} | #{board["G"][2]}
    #{board["A"][1]} | #{board["B"][1]} | #{board["C"][1]} | #{board["D"][1]} | #{board["E"][1]} | #{board["F"][1]} | #{board["G"][1]}
    #{board["A"][0]} | #{board["B"][0]} | #{board["C"][0]} | #{board["D"][0]} | #{board["E"][0]} | #{board["F"][0]} | #{board["G"][0]}"
  end

  def update_board(letter)
    available_row = @board[letter].find_index do |row|
      row == "."
    end
    @board[letter][available_row] = "X"
  end
end