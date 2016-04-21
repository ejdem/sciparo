class CartsController < ApplicationController
  
  def show
    @card    = Cart.find(params[:id])
    @player2 = User.find(1)
    @match   = current_user.active_matches.last
    @result  = @match.turn(@card)
    @whowon = @match.finished?
  end
  
end
