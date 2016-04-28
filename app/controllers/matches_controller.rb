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
    # In match show method printed both player, so that's why
    # we are finding the other player. Cards are also shown
    # so we need to find them all.
    def show
        @match   = Match.find(params[:id])
        @player2 = User.find(@match.player2_id)
        @cards   = Cart.all
    end
    
    
    private
    
    def match_params
        params.require(:match).permit(:player1_id)
    end
end
