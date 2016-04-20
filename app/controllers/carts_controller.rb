class CartsController < ApplicationController
  
  def show
    @card   = Cart.find(params[:id])
    @match  = current_user.active_matches.last
    @result = @match.turn(@card)
  end
  
end
