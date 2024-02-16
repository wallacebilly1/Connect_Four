class Board
  attr_reader :board

  def initialize
    @board = {
      A: %w[. . . . . .],
      B: %w[. . . . . .],
      C: %w[. . . . . .],
      D: %w[. . . . . .],
      E: %w[. . . . . .],
      F: %w[. . . . . .],
      G: %w[. . . . . .]
    }
  end
end