class Admin::BooksController < AdminController
  def index
    @books = Book.page(params[:page])
    @genres = Genre.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
    redirect_to admin_books_path
  end
end
