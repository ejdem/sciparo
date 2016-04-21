class PagesController < ApplicationController
    def home
    end
    
    def hall
        @users = User.all
        @users.order(wins: :desc)
    end
    
    def instructs
    end
end
