class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    # render 'new'
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      redirect_to '/matches/new'
    else
      flash.now[:danger] = "user not found"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_utl
    flash[:success] = "Match finished"
  end
end
