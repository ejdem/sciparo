class MatchesController < ApplicationController
    
    
    def new
        @match = Match.new
    end
    
    def create
        @match = current_user.start_match
        if @match.save
            flash[:success] = "match starts!"
            redirect_to @match
        else
            flash[:danger] = "ooops! something went wrong"
        end
    end
    
    def show
        @match = Match.find(params[:id])
    end
    
    private
    
    def match_params
        params.require(:match).permit(:player1_id)
    end
end
