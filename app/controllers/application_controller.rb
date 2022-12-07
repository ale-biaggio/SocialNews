class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :surname, :phone, :username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :name, :surname, :phone, :username])
    end

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end
end
