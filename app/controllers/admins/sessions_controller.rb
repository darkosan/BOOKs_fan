# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  layout "admin"
  # GET /resource/sign_in
  def new
    @admin = Admin.new
  end

  # POST /resource/sign_in
  def create
    email = params[:admin][:email]
    password = params[:admin][:password]
    @admin = Admin.new(email: email)
    if @admin && @admin.valid_password?(password)
      sign_in(admin)
      redirect_to admin_users_path
    else
      flash.now[:alert] = "ログインに失敗しました"
      render 'admins/sessions/new'
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def after_sign_in_path_for(resource)
    admin_users_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
