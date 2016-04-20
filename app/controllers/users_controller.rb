class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your user is ready"
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name)
  end
end
