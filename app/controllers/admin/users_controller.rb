class Admin::UsersController < AdminController
  def index
    @users = User.all
    @genres = Genre.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザーを削除しました"
  end
end
