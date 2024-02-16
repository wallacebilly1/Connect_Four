class Board
  attr_reader :visual

  def initialize
    @visual = {
      "A" => %w[. . . . . .],
      "B" => %w[. . . . . .],
      "C" => %w[. . . . . .],
      "D" => %w[. . . . . .],
      "E" => %w[. . . . . .],
      "F" => %w[. . . . . .],
      "G" => %w[. . . . . .]
    }
  end

  def print_visual
    "
    A | B | C | D | E | F | G \n
    #{visual["A"][5]} | #{visual["B"][5]} | #{visual["C"][5]} | #{visual["D"][5]} | #{visual["E"][5]} | #{visual["F"][5]} | #{visual["G"][5]}
    #{visual["A"][4]} | #{visual["B"][4]} | #{visual["C"][4]} | #{visual["D"][4]} | #{visual["E"][4]} | #{visual["F"][4]} | #{visual["G"][4]}
    #{visual["A"][3]} | #{visual["B"][3]} | #{visual["C"][3]} | #{visual["D"][3]} | #{visual["E"][3]} | #{visual["F"][3]} | #{visual["G"][3]}
    #{visual["A"][2]} | #{visual["B"][2]} | #{visual["C"][2]} | #{visual["D"][2]} | #{visual["E"][2]} | #{visual["F"][2]} | #{visual["G"][2]}
    #{visual["A"][1]} | #{visual["B"][1]} | #{visual["C"][1]} | #{visual["D"][1]} | #{visual["E"][1]} | #{visual["F"][1]} | #{visual["G"][1]}
    #{visual["A"][0]} | #{visual["B"][0]} | #{visual["C"][0]} | #{visual["D"][0]} | #{visual["E"][0]} | #{visual["F"][0]} | #{visual["G"][0]}"
  end

  def update_board(letter, player)
    available_row = @visual[letter].find_index do |row|
      row == "."
    end
    @visual[letter][available_row] = player.piece
  end
end