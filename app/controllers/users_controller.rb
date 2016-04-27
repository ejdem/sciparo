class UsersController < ApplicationController
  
  # Will print two columns of best players.
  # Limited for security (avoid to long load).
  def streaks
    @usersStreaks  = User.all
                         .order(streak: :desc)
                         .limit(30)
                         .paginate(page: params[:streak_page], per_page: 10)
    respond_to do |format|
      format.js
    end  
  end
  
  def points
    @usersPoints = User.all
                       .order(points: :desc)
                       .limit(30)
                       .paginate(page: params[:points_page], per_page: 10)
    respond_to do |format|
      format.js
    end
  end
  
  def wins
    @usersWins = User.all
                      .order(wins: :desc)
                      .limit(30)
                      .paginate(page: params[:wins_page], per_page: 10)
    respond_to do |format|
      format.js
    end
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
