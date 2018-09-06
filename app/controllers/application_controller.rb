class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	# before_action :configure_permitted_parameters, if: :devise_controller?
		
# 	protected
# 	def configure_permitted_parameters
# 		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :country, :province, :district, :city)}
# 		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :role, :passwrod, :remember_me)}
# #		devise_parameter_sanitizer.permit(:accout_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :address)}
# 	end
end
