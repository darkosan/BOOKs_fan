# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  #def create
  #  super do |resource|
  #    flash[:alert] = resource.errors.full_messages.join("、")
  #  end
  #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    books_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
