class GenresController < ApplicationController


  def show
    @genre = Genre.find(params[:id])
    @spendings = current_user.spendings.where(start_time: Date.today.all_month)
    @spendings = @genre.spendings
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