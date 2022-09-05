class GenresController < ApplicationController


  def show
    @user = current_user
    @genre = Genre.find(params[:id])
    @genre_spendings = @genre.spendings
    @spendings = @genre_spendings.where(start_time: Time.current.all_month)
  end

  def new
    @genre = Genre.new
  end


  def create
    @genre = Genre.new(genre_params)
    @genre.save!
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end