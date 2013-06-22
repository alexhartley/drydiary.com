class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create, :update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        { u.permit(*sign_up_params) }
    devise_parameter_sanitizer.for(:account_update) { u.permit(*account_update_params) }
  end

  private

  def sign_up_params
    [
      :username,
      :email,
      :password,
      :pronoun,
      :custom_pronoun,
      :addiction
    ]
  end

  def account_update_params
    [
      :username,
      :email,
      :current_password,
      :password,
      :password_confirmation,
      :pronoun,
      :custom_pronoun,
      :addiction
    ]
  end

end
