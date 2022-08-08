class GoalsController < ApplicationController

  def index
    @goal = Goal.new
    @goals = Goal.all
    @user = User.where.not(id: current_user.id).all
    @like = Like.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.save
    redirect_to user_path(current_user), notice: "目標が登録されました"
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    redirect_to user_path(current_user), notice: "目標が更新されました"
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_path(current_user)
  end

  private

  def goal_params
    params.require(:goal).permit(:goal, :achievement)
  end
end
