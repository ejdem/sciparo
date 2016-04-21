class Cart < ActiveRecord::Base
    
    # Checks which card is winning.
    # Input argument is integer - card's id.
    def wins?(other_card)
      if wins_with1 == other_card || wins_with2 == other_card
          return true
      else
          return false
      end
    end
end
