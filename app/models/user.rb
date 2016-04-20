class User < ActiveRecord::Base
    has_many :matches
    has_many :active_matches, class_name: "Match",
                              foreign_key: "player1_id"
    has_many :passif_matches, class_name: "Match",
                              foreign_key: "player2_id"
                             
    def start_match
        self.active_matches.create!(player1_id: self.id, player2_id: 1)
    end
end
