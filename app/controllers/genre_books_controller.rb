class GenreBooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @genre = Genre.find(params[:genre_id])
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

