class Match < ActiveRecord::Base
    belongs_to :playerWhoStarted, class_name: "User"
end
