class SpendingsController < ApplicationController

  def index
    @user = current_user
    @spendings = @user.spendings.all
  end

  def lastmonth
    @user = current_user
    @genres = Genre.all
    @spendings = @user.spendings.where(start_time: Time.current.all_month)
    @last_month = @user.spendings.where(start_time: Time.current.last_month.all_month)
    @chart = @last_month.joins(:genre).group("genres.name").sum(:spending_amount).sort_by {|_,v|v}.reverse.to_h
  end

  def graph
    @user = current_user
    @genres = Genre.all
    @spendings = @user.spendings.where(start_time: Time.current.all_month)
    @last_month = @user.spendings.where(start_time: Time.current.last_month.all_month)
    @month = Date.today.month
    @chart = @spendings.joins(:genre).group("genres.name").sum(:spending_amount).sort_by {|_,v|v}.reverse.to_h

  end

  def show
    @spending = Spending.find(params[:id])
  end

  def new
    @spending = Spending.new
    @genres = Genre.all
    @user = current_user
  end

  def create
    @spending = Spending.new(spending_params)
    @spending.user_id = current_user.id
    if @spending.save
      flash[:success] = "登録が完了しました。"
      redirect_to new_spending_path
    else
      render :new
    end
  end

  def edit
    @spending = Spending.find(params[:id])
    @genres = Genre.all
  end

  def update
    @spending = Spending.find(params[:id])
    if @spending.update(spending_params)
       flash[:success] = "支出が編集されました"
       redirect_to spendings_path
    else
       render :edit
    end
  end

  def destroy
    @spending = Spending.find(params[:id])
    if @spending.destroy
    flash[:success] = '削除しました'
    redirect_to spendings_path
    end
  end

  private

  def spending_params
    params.require(:spending).permit(:spending_amount, :genre_id, :memo, :start_time)
  end
end
