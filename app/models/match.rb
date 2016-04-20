class Match < ActiveRecord::Base
    belongs_to :playerWhoStarted, class_name: "User"
    belongs_to :secondPlayed,     class_name: "User"
    
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
end
