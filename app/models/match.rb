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
        if self.player1_lifes < 0 || self.player2_lifes < 0
            puts 'game is over!'
            return true
        else
            return false
        end
    end
    # Generates random computer move, return id to card that computer chosed.
    def computer_move
        @cards = Cart.all
        @cards[rand(5)].id
    end
    # make a turn, user choses his action, chekcs if wins with computer.
    # Input argument is object of type Card (or rather 'Cart',
    # as someone has apparently some grammar problems.
    def turn(player_move)
        # @cm      = computer_move
        @player1 = User.find(self.player1_id)
        @player2 = User.find(self.player2_id)
        answer = ""
        if player_move.id == computer_move
            # Remis.
            result = 2
            self.remis_add_points(@player1, @player2)
            answer += 'remis'
        else
            result = player_move.wins?(computer_move)
            if result
                self.add_points(@player1, @player2)
                self.lose_live(self.player2_id)
                answer += 'player 1 wins'
            else
                self.lose_live(self.player1_id)
                self.add_points(@player2, @player1)
                answer += 'player 2 wins'
            end
        end
        answer
    end
    # Increments streak if remis for bouth
    def remis_add_points(player1, player2)
        player1.streak += 1
        player2.streak += 1
    end
    # Increments points for player who won.
    def add_points(player1, player2)
        player1.wins   += 1
        player1.streak += 1
        player2.loses  += 1
    end
end
