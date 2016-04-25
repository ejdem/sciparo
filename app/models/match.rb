class Match < ActiveRecord::Base
    belongs_to :playerWhoStarted, class_name: "User"
    belongs_to :secondPlayed,     class_name: "User"

    # Make a turn, user choses his action, chekcs if wins with computer.
    # Input argument is object of type Card (or rather 'Cart',
    # as someone has apparently some grammar problems.
    # Output is a hash with strings, so I coul iterate it in view.    
=begin    
    def turn(player1_card)
        @p1streak = 0
        @p2streak = 0
        # Finds players.
        player1 = User.find(self.player1_id)
        player2 = User.find(self.player2_id)
        # Determines computer's card.
        player2_card = chose_computer_card
        # Creates hash for output. Then inserts strings to create ouput.
        answer       = []
        answer[0]    = "player 2 plays #{player2_card.name}"
        answer[1]    = self.who_wins(player1_card,player2_card,player1, player2, @p1streak, @p2streak)
        answer[2]    = self.finished?(player1,player2)
        # Returns answer.
        answer
    end
=end    
    # NEW TURN FUNCTION
    def turn(player1_card)
        # Finds players.
        @player1 = User.find(self.player1_id)
        @player2 = User.find(self.player2_id)
        # Local variables to count streaks.
        # Choses player 2 card.
        @player2_card = chose_computer_card
        #  Variable to keep answer.
        @answer = []
        @answer.push("You have played #{player1_card.name}")
        @answer.push("Player 2 playes #{@player2_card.name}.")
        if player1_card == @player2_card
            self.player1_streak += 1
            self.player2_streak += 1
            @answer.push("You both played the same card - remis.")
            @answer.push("Actual streaks:")
            @answer.push("Player1: #{self.player1_streak}")
            @answer.push("Player2: #{self.player2_streak}")
            self.save
            if @player1.streak < self.player1_streak
                @player1.streak = self.player1_streak
                @player1.save
            end
            if @player2.streak < self.player2_streak
                @player2.streak = self.player2_streak
                @player2.save
            end
        elsif player1_card.wins?(@player2_card.id)
            self.player1_streak    += 1
            self.player2_streak     = 0
            self.player2_lifes -= 1
            self.save
            if @player1.streak < self.player1_streak
                @player1.streak = self.player1_streak
                @player1.save
            end
            @answer.push("Actual streaks:")
            @answer.push("Player1: #{self.player1_streak}")
            @answer.push("Player2: #{self.player2_streak}")
            @answer.push("You have won that turn!")
        else
            self.player1_streak = 0
            self.player2_streak += 1
            self.player1_lifes  -= 1
            self.save
            if @player2.streak < self.player2_streak
                @player2.streak = self.player2_streak
                @player2.save
            end
            @answer.push("Actual streaks:")
            @answer.push("Player1: #{self.player1_streak}")
            @answer.push("Player2: #{self.player2_streak}")
            @answer.push("Player 2 has won that turn!")
        end
        @answer.push(self.finished?(@player1, @player2))
        @answer
    end
    # END OF NEW TURN FUNCTION
    # Checks if players still have lives.
    # Two players as input, to change wins.
    def finished?(player1, player2)
        if self.player1_lifes < 0 #&& self.player2_lifes > 0
            @player1_streak = 0
            @player2_streak = 0
            player2.wins  += 1
            player1.loses += 1
            player1.save
            player2.save
            "Player 2 has won the match!"
        elsif self.player2_lifes < 0 #&& self.player2_lifes < 0
            @player1_streak = 0
            @player2_streak = 0
            player1.wins  += 1
            player2.loses += 1
            player1.save
            player2.save
            "Player 1 has won the match!"
        else
            "Not finished yet"
        end
    end
    # Generates random computer move, return card that computer chosed.
    def chose_computer_card
        @cards = Cart.all
        @cards[rand(5)]
    end
    # Checks relations which card wins.
    # As input two Cart class objects (yes, shoud be "Card").
    # And two User classes.
=begin    def who_wins(player1_card,player2_card, player1, player2)
        # Determines result of turn.
        if player1_card == player2_card
            self.remis_add_points(player1,player2)
            "remis"
        elsif player1_card.wins?(player2_card.id)
            self.add_points(player1, player2)
            self.player2_lifes -= 1
            self.save
            "player 1 wins this turn"
        else
            self.add_points(player2, player1)
            self.player1_lifes -= 1
            self.save
            "player 2 wins this turn"
        end
=end    end
    # Incremets streaks when remis.
    def remis_add_points(player1, player2)
        player1.streak += 1
        player2.streak += 1
        player1.save
        player2.save
    end
    # Increments and decrements players stats when one wins.
    def add_points(player_wins, player_loses)
        player_wins.streak += 1
        player_loses.streak = 0
        player_wins.save
        player_loses.save
    end

end
