class User < ActiveRecord::Base
    has_many :matches
    has_many :active_matches, class_name: "Match",
                              foreign_key: "player1_id"
    has_many :passif_matches, class_name: "Match",
                              foreign_key: "player2_id"
    validates :name, presence: true
    # Creates new match in relationship with actual player, sets its opponent to default player : computer.
    # Increments number of played matches for bought, saves all changes.
    def start_match
        u = User.find(1)
        self.played_matches += 1
        u.played_matches    += 1
        u.save
        self.active_matches.create(player1_id: self.id, player2_id: 1)
    end
end
