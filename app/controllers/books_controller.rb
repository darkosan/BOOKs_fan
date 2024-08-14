class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)

  def new
    @book = Book.new
    @genres = Genre.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @genres = Genre.all
  end

  def show
    @book = Book.find(params[:id])
    @post_comment = PostComment.new
    @genres = Genre.all
  end

  def edit
    @book = Book.find(params[:id])
    @genres = Genre.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(book.user_id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :genre_id)
  end
end
