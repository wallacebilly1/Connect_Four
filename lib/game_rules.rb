module GameRules
  def win?
    sw_to_ne_diagonal_win? || se_to_nw_diagonal_win? || horizontal_win? || vertical_win?
  end

  def check_for_draw?
    @turns_taken > 42
  end

  def is_valid?(input)
    is_valid_column?(input) && !is_column_full?(input)
  end
  
  def is_valid_column?(input)
    %w[A B C D E F G].include?(input)
  end
  
  def is_column_full?(input)
    @board.visual[input].none?(".")
  end

  def vertical_win?
    count = 1
    temp_last_piece = @board.last_piece_played
    if temp_last_piece[1] != 0
      while @board.visual[temp_last_piece[0]][temp_last_piece[1] -= 1] == current_player.piece 
        count += 1
      end
    end
    return true if count >= 4
    false
  end

  def horizontal_win?
    count = 1
    temp_last_piece = [@board.last_piece_played[0].ord, @board.last_piece_played[1]]
    if temp_last_piece[0] > 65
      while @board.visual[(temp_last_piece[0] -= 1).chr][temp_last_piece[1]] == current_player.piece
        count += 1
        break if temp_last_piece[0] == 65
      end
    end

    temp_last_piece = [@board.last_piece_played[0].ord, @board.last_piece_played[1]]
    if temp_last_piece[0] < 71
      while @board.visual[(temp_last_piece[0] += 1).chr][temp_last_piece[1]] == current_player.piece
          count += 1
          break if temp_last_piece[0] == 71
      end
    end
    return true if count >= 4
    false
  end

  def sw_to_ne_diagonal_win?
    count = 1
    temp_last_piece = [@board.last_piece_played[0].ord, @board.last_piece_played[1]]
    if temp_last_piece[0] > 65
      while @board.visual[(temp_last_piece[0] -= 1).chr][temp_last_piece[1] -= 1] == current_player.piece
          count += 1
          break if temp_last_piece[0] == 65
      end
    end

    temp_last_piece = [@board.last_piece_played[0].ord, @board.last_piece_played[1]]
    if temp_last_piece[0] < 71
      while @board.visual[(temp_last_piece[0] += 1).chr][temp_last_piece[1] += 1] == current_player.piece
        count += 1
        break if temp_last_piece[0] == 71
      end
    end
    return true if count >= 4
    false
  end

  def se_to_nw_diagonal_win?
    count = 1
    temp_last_piece = [@board.last_piece_played[0].ord, @board.last_piece_played[1]]
    if temp_last_piece[0] > 65
      while @board.visual[(temp_last_piece[0] -= 1).chr][temp_last_piece[1] += 1] == current_player.piece
          count += 1
          break if temp_last_piece[0] == 65
      end
    end

    temp_last_piece = [@board.last_piece_played[0].ord, @board.last_piece_played[1]]
    if temp_last_piece[0] < 71
      while @board.visual[(temp_last_piece[0] += 1).chr][temp_last_piece[1] -= 1] == current_player.piece
        count += 1
        break if temp_last_piece[0] == 71
      end
    end
    return true if count >= 4
    false
  end
end