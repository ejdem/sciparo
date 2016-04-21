class CartsController < ApplicationController
  
  # Finds chosen card.
  # Finds current match.
  # Finds other player, to print his stats.
  def show
    @card    = Cart.find(params[:id])
    @match   = current_user.active_matches.last
    @player2 = User.find(@match.player2_id)
    @result  = @match.turn(@card)
    #@whowon  = @match.finished?
    if @result[2] != "Not finished yet"
        respond_to do |format|
            format.js { render :js => "window.location.href = '#{root_url}'" }
        end
    end
  end
  
end
