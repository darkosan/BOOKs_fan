class SearchesController < ApplicationController
  before_action :authenticate_user!

 def search
    @word = params[:word]
    @genres = Genre.all

  @books = Book.looks(params[:search], params[:word])
  end
end
