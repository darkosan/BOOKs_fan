class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
    @genres = Genre.all
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "投稿に成功しました。"
    else
      @genres = Genre.all
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @books = Book.all.page(params[:page])
    @genres = Genre.all
    if params[:genre_id].present?
      @genre = Genre.find_by(id: params[:genre_id])
      if @genre.present?
        @books = @books.where(genre_id: @genre.id)
      end
    end

    if params[:word].present? && params[:search].present?
      @books = @books.search_by_title(params[:search], params[:word])
    end
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.page(params[:page])
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
      @genres = Genre.all
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
    params.require(:book).permit(:title, :body, :image, :genre_id, :star)
  end
end
