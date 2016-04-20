class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Your user is ready"
      redirect_to       '/matches/new'
    else
      redirect_to 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name)
  end
end
