class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @genres = Genre.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @genres = Genre.all
  end
end
