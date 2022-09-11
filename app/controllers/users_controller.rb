class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @genres = Genre.all
    @spendings = @user.spendings.where(start_time: Time.current.all_month)
    @last_month = @user.spendings.where(start_time: Time.current.last_month.all_month)
    @month = Date.today.month
    @chart = @spendings.joins(:genre).group("genres.name").sum(:spending_amount).sort_by {|_,v|v}.reverse.to_h
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path, notice: "プロフィールが更新されました"
  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :sex, :profession, :location, :is_active, :profile_image)
  end
end
