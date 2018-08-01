class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
    @average_rating = @genre.songs.average_rating
  end

end