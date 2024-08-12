class GenresController < ApplicationController

  def new
   @genre = Genre.new
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path, notice: "ジャンルを登録しました"
    else
      redirect_to genres_path, alert: "ジャンルの登録に失敗しました"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path, notice: "ジャンルを更新しました"
    else
      redirect_to genres_path, alert: "ジャンルの登録に失敗しました"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
