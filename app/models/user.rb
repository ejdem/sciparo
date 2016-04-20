class User < ActiveRecord::Base
    has_many :matches
    has_many :active_matches, class_name: "Match",
                              foreign_key: "player_id"
end
