class SearchesController < ApplicationController
  before_action :authenticate_user!

 def search
    @range = params[:range]
    @word = params[:word]
    @genres = Genre.all

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end
