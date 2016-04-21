class Match < ActiveRecord::Base
    belongs_to :playerWhoStarted, class_name: "User"
    belongs_to :secondPlayed,     class_name: "User"
    
    # Checks if players still have lives.
    def finished?
        if    self.player1_lifes < 0 && self.player2_lifes > 0
            "Player 2 has won!"
        elsif self.player1_lifes > 0 && self.player2_lifes < 0
            "Player 1 has won!"
        end
    end
    # Generates random computer move, return card that computer chosed.
    def computer_card
        @cards = Cart.all
        @cards[rand(5)]
    end
    # Checks relations which card wins.
    # As input two Cart class objects (yes, shoud be "Card").
    def who_wins(player1_card,player2_card)
        player1 = User.find(self.player1_id)
        player2 = User.find(self.player2_id)
        # Determines result of turn.
        if player1_card == player2_card
            self.remis_add_points(player1,player2)
            "remis"
        elsif player1_card.wins?(player2_card.id)
            self.add_points(player1, player2)
            self.player2_lifes -= 1
            self.save!
            "player 1 wins"
        else
            self.add_points(player2, player1)
            self.player1_lifes -= 1
            self.save!
            "player 2 wins"
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
    # make a turn, user choses his action, chekcs if wins with computer.
    # Input argument is object of type Card (or rather 'Cart',
    # as someone has apparently some grammar problems.
    # Output is a hash with strings, so I coul iterate it in view.
    def turn(player1_card)
        player2_card = computer_card
        answer       = []
        answer[0]    = "player 2 plays #{player2_card.name}"
        answer[1]    = self.who_wins(player1_card,player2_card)
        answer
    end
end
