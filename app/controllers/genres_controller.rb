class GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
    @books = Book.all
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
