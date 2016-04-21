class MatchesController < ApplicationController
    
    def new
        @match = Match.new
    end
    
    def create
        @match = current_user.start_match
        if @match.save!
            current_user.save!
            flash.now[:success] = "match starts!"
            redirect_to @match
        else
            flash[:danger] = "ooops! something went wrong"
        end
    end
    
    def show
        @match   = Match.find(params[:id])
        @player2 = User.find(@match.player2_id)
        @cards   = Cart.all
    end
    
    def video
        @youtube = 'https://www.youtube.com/embed/watch?v=iapcKVn7DdY'
        sleep 2
        redirect_to root_url
    end
    
    private
    
    def match_params
        params.require(:match).permit(:player1_id)
    end
end
