class Match < ActiveRecord::Base
    belongs_to :playerWhoStarted, class_name: "User"
    belongs_to :secondPlayed,     class_name: "User"
    # Checks if players still have lives.
    # Two players as input, to change wins.
    def finished?(player1, player2)
        if self.player1_lifes < 0 #&& self.player2_lifes > 0
            player1.wins += 1
            "Player 2 has won the match!"
        elsif self.player2_lifes < 0 #&& self.player2_lifes < 0
            player2.wins += 1
            "Player 1 has won the match!"
        else
            "Not finished yet"
        end
    end
    # Generates random computer move, return card that computer chosed.
    def computer_card
        @cards = Cart.all
        @cards[rand(5)]
    end
    # Checks relations which card wins.
    # As input two Cart class objects (yes, shoud be "Card").
    # And two User classes.
    def who_wins(player1_card,player2_card, player1, player2)
        # Determines result of turn.
        if player1_card == player2_card
            self.remis_add_points(player1,player2)
            "remis"
        elsif player1_card.wins?(player2_card.id)
            self.add_points(player1, player2)
            self.player2_lifes -= 1
            self.save!
            "player 1 wins this turn"
        else
            self.add_points(player2, player1)
            self.player1_lifes -= 1
            self.save!
            "player 2 wins this turn"
        end
    end
    # Incremets streaks when remis.
    def remis_add_points(player1, player2)
        player1.streak += 1
        player2.streak += 1
        player1.save!
        player2.save!
    end
    # Increments and decrements players stats when one wins.
    def add_points(player_wins, player_loses)
        player_wins.wins   += 1
        player_wins.streak += 1
        player_loses.loses += 1
        player_loses.streak = 0
        player_wins.save!
        player_loses.save!
    end
    # Make a turn, user choses his action, chekcs if wins with computer.
    # Input argument is object of type Card (or rather 'Cart',
    # as someone has apparently some grammar problems.
    # Output is a hash with strings, so I coul iterate it in view.
    def turn(player1_card)
        # Finds players.
        player1 = User.find(self.player1_id)
        player2 = User.find(self.player2_id)
        # Determines computer's card.
        player2_card = computer_card
        # Creates hash for output. Then inserts strings to create ouput.
        answer       = []
        answer[0]    = "player 2 plays #{player2_card.name}"
        answer[1]    = self.who_wins(player1_card,player2_card,player1, player2)
        answer[2]    = self.finished?(player1,player2)
        # Returns answer.
        answer
    end
end
