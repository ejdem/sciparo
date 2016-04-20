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
    log_out
    redirect_to root_url
    flash[:success] = "Match finished"
  end
end
