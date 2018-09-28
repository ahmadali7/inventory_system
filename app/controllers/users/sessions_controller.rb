# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #before_action :generate_order_from_cookies, only: [:create]
  include AddToCartConcern
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if !cookies[:cart].nil?
      x = JSON.parse(cookies[:cart])
      x.each do |p|
        notice = add_order(p["product_id"].to_i, p["quantity"].to_i, current_user.id)
      end
      cookies.delete :cart
    end
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
