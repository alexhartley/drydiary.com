class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters_for_create, only: :create
  before_filter :configure_permitted_parameters_for_update, only: :update

  protected

  def configure_permitted_parameters_for_create
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(*sign_up_permitted_params)
    end
  end

  def configure_permitted_parameters_for_update
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(*account_update_permitted_params)
    end
  end

  private

  def sign_up_permitted_params
    [
      :username,
      :email,
      :password,
      :password_confirmation,
      :pronoun,
      :custom_pronoun,
      :addiction
    ]
  end

  def account_update_permitted_params
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
