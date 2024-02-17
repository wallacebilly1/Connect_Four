class Message

    def welcome
        "Welcome to CONNECT FOUR\nEnter p to play, enter q to quit."
    end

    def choose_column
        "Please choose a column (A-G) to place your piece."
    end

    def current_player_turn(player)
        "It is currently #{player}'s turn."
    end

end