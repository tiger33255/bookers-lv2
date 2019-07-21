class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:new,:about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end

    def after_sign_in_path_for(resource)
      flash[:notice] = "Welcome! You have signed up successfully."
      user_path(@user)
    end

    def after_log_in_path_for(resource)
      flash[:notice] = "Signed in successfully."
      user_path(@user)
    end

    def after_sign_out_path_for(resource)
      flash[:notice] = "Signed out successfully."
      root_path
    end

end
