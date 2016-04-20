class MatchesController < ApplicationController
    
    def index
        @match = Match.find(params[:id])
    end
    
    def new
        @match = Match.new
    end
    
    def create
    end
    
    def show
        @match = Match.find(params[:id])
    end
end
