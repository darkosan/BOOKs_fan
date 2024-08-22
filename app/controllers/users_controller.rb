class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: %i(edit)
  def index
    @users = User.all
    @genres = Genre.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @genres = Genre.all
  end

  private

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end
end

