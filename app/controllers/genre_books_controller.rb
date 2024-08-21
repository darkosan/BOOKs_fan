class GenreBooksController < ApplicationController

  def index
    @genre = Genre.find_by(params[:genre_id])
    @genres = Genre.all
    @books = Book.where(genre_id: @genre.id)
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

  def book_params
    params.require(:book).permit(:title, :body, :image, :genre_id, :star)
  end

end

