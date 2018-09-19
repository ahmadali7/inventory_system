# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
   super
    # @user = User.new
   @user.photos.build
  end

  # POST /resource
  def create
    super
      if @user.save
        params[:photos]['image'].each do |a|
          @photo = @user.photos.create!(:image => a)
        end
      end
  end

  def add_user
    @user = User.new
    # @user = User.create(user_params)

    #   if !@user.nil?
    #     params[:photos]['image'].each do |a|
    #       @photo = @user.photos.create!(:image => a)
    #     end

    #   end
    #   redirect_to root_path, notice: 'User was successfully created.' 
    # authorize @user
  end
  def create_user
    @user = User.new(user_params)
      if @user.save
        params[:photos]['image'].each do |a|
          @photo = @user.photos.create!(:image => a)
        end

      end
      redirect_to root_path, notice: 'User was successfully created.' 
    authorize @user
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :country, :province, :district, :city, photos_attributes: [ :image ])
  end

  def user_params
    puts "Params: #{params.inspect}"
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :country, :province, :district, :city, :role, photos_attributes: [ :image ] )

  end

  # If you have extra params to permit, append them to the sanitizer.
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :address)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
