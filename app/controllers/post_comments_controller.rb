class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_to book_path(book), notice:  "コメントに成功しました。"
    else
      flash.now[:alert] = "コメントに失敗しました。"
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end


end
