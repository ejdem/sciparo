class UsersController < ApplicationController
  
  def index
    @users   = User.all
                   .order(wins: :desc)
                   .paginate(page: params[:wins_page], per_page: 10)
    @users2  = User.all
                   .order(streak: :desc)
                   .paginate(page: params[:streak_page], per_page: 10)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Your user is ready"
      redirect_to instructs_path
    else
      render 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name)
  end
  
end
