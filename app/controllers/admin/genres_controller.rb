class Admin::GenresController < Admin::BaseController

    def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      flash[:notice] = 'Item cannot be created, please make sure to fill the form correctly'
      redirect_to genre_path(@genre)
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
