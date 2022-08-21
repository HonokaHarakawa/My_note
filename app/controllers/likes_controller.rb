class LikesController < ApplicationController

  def index
    @user = current_user
    likes = Like.where(user_id: @user.id).pluck(:goal_id)
    @like_goals = Goal.find(likes)
  end


  def create
    @like = current_user.likes.create(goal_id: params[:goal_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @goal = Goal.find(params[:goal_id])
    @like = current_user.likes.find_by(goal_id: @goal.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
