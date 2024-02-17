class Player
  attr_reader :name, :piece

  def initialize(name = "Computer")
    @name = name
    @piece = choose_piece
  end

  def choose_piece
    if name == "Computer"
      @piece = "O"
    else 
      @piece = "X"
    end
  end

  def choose_column
    gets.chomp
  end
end