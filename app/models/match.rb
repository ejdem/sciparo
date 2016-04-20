class Match < ActiveRecord::Base
    belongs_to :playerWhoStarted, class_name: "User"
    belongs_to :secondPlayed,     class_name: "User"
    
    # Decreases a number of lives of a plaver.
    # Input arg is integer, for player id
    def lose_live(player)
        if player == self.player1_id
          self.player1_lifes -= 1
        else
          self.player2_lifes -= 1
        end
        self.save!
    end
    
    def finished?
        return true if self.player1_lifes < 0 || self.player2_lifes < 0
    end
    
    # Generates random computer move, return id to card that computer chosed.
    def computer_move
        @cards = Cart.all
        @cards[rand(6)].id
    end
    # make a turn, user choses his action, chekcs if wins with computer.
    # Input argument is object of type Card.
    def turn(player_move)
        @cm = computer_move
        if player_move.id == computer_move
            # Remis.
            result = 2
            puts 'remis'
        else
            result = player_move.wins?(computer_move)
            if result
                self.lose_live(self.player2_id)
                puts 'player 1 wins'
            else
                self.lose_live(self.player1_id)
                puts 'player 2 wins'
            end
        end
    end
end
