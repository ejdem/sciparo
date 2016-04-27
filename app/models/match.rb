class Match < ActiveRecord::Base
    belongs_to :playerWhoStarted, class_name: "User"
    belongs_to :secondPlayed,     class_name: "User"

    # Make a turn, user choses his action, chekcs if wins with computer.
    # Input argument is object of type Card (or rather 'Cart',
    # as someone has apparently some grammar problems.
    # Output is a hash with strings, so it could be iterated it in view.    
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
        # Determines player who won, adds streaks.
        if player1_card == @player2_card
            self.add_remis_streak
            self.update_streak(0)
        elsif player1_card.wins?(@player2_card.id)
            self.add_player_wins_streak(1)
            self.update_streak(1)
            self.update_points(1)
        else
            self.add_player_wins_streak(2)
            self.update_streak(2)
            self.update_points(1)
        end
        # Add last string, that says who won, if won.
        @answer.push(self.finished?)
        @answer
    end
    # END OF NEW TURN FUNCTION
    # Checks if players still have lives.
    # Two players as input, to change wins.
    def finished?
        if self.player1_lifes < 0
            @player2.wins  += 1
            @player1.loses += 1
            @player1.save
            @player2.save
            "Player 2 has won the match!"
        elsif self.player2_lifes < 0
            @player1.wins  += 1
            @player2.loses += 1
            @player1.save
            @player2.save
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
    # Incremets streaks when remis.
    # Returns hash of strings to print in view.
    def add_remis_streak
        self.player1_streak += 1
        self.player2_streak += 1
        self.save
        @answer.push("You both played the same card - remis.")
        @answer.push("Actual streaks:")
        @answer.push("Player1: #{self.player1_streak}")
        @answer.push("Player2: #{self.player2_streak}")  
    end
    # Adds streak for player who won, and reset for those, who lost.
    # puts strings into @answer, that would be printed in view.
    def add_player_wins_streak(who)
        if who == 1
            self.player1_streak += 1
            self.player1_points += 1
            self.player2_streak  = 0
            self.player2_lifes  -= 1
            self.print_streak(1)
            self.save
        else
            self.player1_streak  = 0
            self.player2_points += 1
            self.player2_streak += 1
            self.player1_lifes  -= 1
            self.print_streak(2)
            self.save
        end
    end
    # Pushes info about streaks into answer variable.
    def print_streak(player)
        @answer.push("Actual streaks:")
        @answer.push("Player1: #{self.player1_streak}")
        @answer.push("Player2: #{self.player2_streak}")
        @answer.push("Actual points:")
        @answer.push("Player1: #{self.player1_points}")
        @answer.push("Player2: #{self.player2_points}")
        if player == 1
            @answer.push("You have won that turn!")
        else
            @answer.push("Player 2 has won that turn!")
        end
    end
    # If actual streak is bigger than those in player memory,
    # chages values. Otherwise, longest streak lasts in user's memory.
    def update_streak(forwho)
        if forwho == 0
            if @player1.streak < self.player1_streak
                @player1.streak = self.player1_streak
                @player1.save
            end
            if @player2.streak < self.player2_streak
                @player2.streak = self.player2_streak
                @player2.save
            end
        elsif forwho == 1
            if @player1.streak < self.player1_streak
                @player1.streak = self.player1_streak
                @player1.save
            end
        else
            if @player2.streak < self.player2_streak
                @player2.streak = self.player2_streak
                @player2.save
            end
        end
    end
    # Makes the same as method one up, but for points
     def update_points(forwho)
         if forwho == 1
             if @player1.points < self.player1_points
                 @player1.points = self.player1_points
                 @player1.save
             end
         else
             if @player2.points < self.player2_points
                 @player2.points = self.player2_points
                 @player2.save
             end
         end
     end
    
    # End of class.
end
