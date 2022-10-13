class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(created_at: :desc)
    @genres = Genre.all
    @spendings = @user.spendings.where(start_time: Time.current.all_month)
    @last_month = @user.spendings.where(start_time: Time.current.last_month.all_month)
    @month = Date.today.month
    @chart = @spendings.joins(:genre).group("genres.name").sum(:spending_amount).sort_by {|_,v|v}.reverse.to_h
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:success]= 'プロフィールが更新されました'
       redirect_to user_path
    else
       render :edit
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :sex, :profession, :location, :is_active, :profile_image)
  end
end
