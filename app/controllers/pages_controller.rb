class PagesController < ApplicationController
    def home
    end
    
    def hall
        @users = User.all
    end
    
    def instructs
    end
end
