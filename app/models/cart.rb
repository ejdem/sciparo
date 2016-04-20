class Cart < ActiveRecord::Base
    
    # Checks which card is winning.
    # Input argument is integer, id of a card
    def wins?(other_card)
      if self.wins_with1 == other_card || self.wins_with2 == other_card
          return true
      else
          return false
      end
    end
end
