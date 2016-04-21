class Match < ActiveRecord::Base
    belongs_to :playerWhoStarted, class_name: "User"
    belongs_to :secondPlayed,     class_name: "User"
    
    # Decreases a number of lives of a plaver.
    # Input arg is integer, for player id.
    def lose_live(player)
        if player == self.player1_id
          self.player1_lifes -= 1
        else
          self.player2_lifes -= 1
        end
        self.save!
    end
    # Checks if players still have lives.
    def finished?
        if self.player1_lifes < 0 && self.player2_lifes > 0
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
        if player1_card == player2_card
            "remis"
        elsif player1_card.wins?(player2_card.id)
            "player 1 wins"
        else
            "player 2 wins"
        end
    end
    # make a turn, user choses his action, chekcs if wins with computer.
    # Input argument is object of type Card (or rather 'Cart',
    # as someone has apparently some grammar problems.
    def turn(player1_card)
        player2_card = computer_card
        player1      = User.find(self.player1_id)
        player2      = User.find(self.player2_id)
        answer = []
        answer[0] = "player 2 plays #{player2_card.name}"
        answer[1] = self.who_wins(player1_card,player2_card)
        answer
        # answer = []
        # answer[0] = "Computer has played " + cm.name + "\n"
        # if player_card.id == computer_card.id
        #     # Remis.
        #     result = 2
        #     self.remis_add_points(@player1, @player2)
        #     answer[1] = "remis\n"
        # else
        #     # Tu coś nie działa!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        #     result = player_card.wins?(computer_card.id)
        #     if result
        #         self.add_points(@player1, @player2)
        #         self.lose_live(self.player2_id)
        #         answer[1] = "player 1 wins\n"
        #     else
        #         self.lose_live(self.player1_id)
        #         self.add_points(@player2, @player1)
        #         answer[1] = "player 2 wins\n"
        #     end
        # end
        # answer
    end
    # Increments streak if remis for bouth
    # Do poprawienia!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def remis_add_points(player1, player2)
        player1.streak += 1
        player2.streak += 1
        player1.save!
        player2.save!
    end
    # Increments points for player who won.
    def add_points(player1, player2)
        player1.wins   += 1
        player1.streak += 1
        player2.loses  += 1
        player1.save!
        player2.save!
    end
end
