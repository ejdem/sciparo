class UsersController < ApplicationController
  
  # 3 methods for printing best players...
  #...with largest streaks.
  def streaks
    @usersStreaks  = User.where.not(id: 1)
                         .order(streak: :desc)
                         .limit(30)
                         .paginate(page: params[:streak_page], per_page: 10)
    respond_to do |format|
      format.js
      format.html
    end  
  end
  # ...with biggest number of points.
  def points
    @usersPoints = User.where.not(id: 1)
                       .order(points: :desc)
                       .limit(30)
                       .paginate(page: params[:points_page], per_page: 10)
    respond_to do |format|
      format.html
      format.js
    end
  end
  # ...with most matches won.
  def wins
    @usersWins = User.where.not(id: 1)
                     .order(wins: :desc)
                     .limit(30)
                     .paginate(page: params[:wins_page], per_page: 10)
    respond_to do |format|
      format.js
      format.html
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
