class Admin::UsersController < ApplicationController
  layout "admin"
  def index
    @users = User.all
    @genres = Genre.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: "ユーザーを削除しました"
  end
end
