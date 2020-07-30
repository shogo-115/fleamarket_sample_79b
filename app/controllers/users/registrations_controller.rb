# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new 
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @name = @user.build_name
    render :new_names
  end

  def edit
  end

  def update
    user = User.find(current_user.id)
    user.update(user_params)
    render "toppages/index"
  end

  def create_names
    @user = User.new(session["devise.regist_data"]["user"])
    @name = Name.new(name_params)
    unless @name.valid?
      flash.now[:alert] = @name.errors.full_messages
      render :new_names and return
    end
    @user.build_name(@name.attributes)
    session["name"] = @name.attributes
    @address = @user.build_address
    render :new_address
  end

  def edit_names
    @name = Name.find_by(user_id: current_user.id)
  end

  def update_names
    name = Name.find(current_user.id)
    name.update(name_params)
    render "toppages/index"
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @name = Name.new(session["name"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_name(@name.attributes)
    @user.build_address(@address.attributes)
    @user.save
    sign_in(:user, @user)
    render "toppages/index"
  end

  def edit_address
    @address = Address.find_by(user_id: current_user.id)
  end

  def update_address
    address = Address.find(current_user.id)
    address.update(address_params)
    render "toppages/index"
  end

  protected

  def user_params
    params.require(:user).permit(:email, :nick_name)
  end

  def address_params
    params.require(:address).permit(:postNo, :pref, :city, :block, :building, :family_name, :first_name, :family_name_f, :first_name_f, :phon )
  end

  def name_params
    params.require(:name).permit(:family_name, :first_name, :family_name_f, :first_name_f, :birthday, :family_name )
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

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
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
