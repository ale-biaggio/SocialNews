class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    include Pagy::Backend
    # Confirms a logged-in user.
    def logged_in_user
        unless user_signed_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
    end
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :surname, :phone, :username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :name, :surname, :phone, :username])
    end

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end
end
