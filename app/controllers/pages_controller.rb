class PagesController < ApplicationController
    def home
    end
    
    def hall_of_fame
        @users = User.all
    end
    
end
