def turn(player1_card)
    # Finds players.
    @player1 = User.find(self.player1_id)
    @player2 = User.find(self.player2_id)
    # Local variables to count streaks.
    @player1_streak = 0
    @player2_streak = 0
    # Choses player 2 card.
    @player2_card = chose_computer_card
    #  Variable to keep answer.
    @answer = []
    @answer[1] = "player 2 playes #{@player2_card}."
    if player1_card == @player2_card
        @player1_streak += 1
        @player2_streak += 1
        @answer[2] = "You both played the same card - remis."
    elsif player1_card.wins?(@player2_card)
        @player1_streak     += 1
        @player2_streak      = 0
        self.player2_lifes -= 1
        if @player1.streak < @player1_streak
            @player1.streak = @player1_streak
        end
        @answer[3] = "You have won that turn!"
    else
        @player1_streak    = 0
        @player2_streak   += 1
        self.player1_lifes -= 1
        if @player2.streak < @player2_streak
            @player2.streak = @player2_streak
        end
        @answer[3] = "Player 2 has won that turn!"
    end
    self.finished?(@player1, @player2)
end