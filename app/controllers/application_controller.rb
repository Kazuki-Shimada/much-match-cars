class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
    end
    def after_sign_in_path_for(resource)
      case resource
      when Admin
        admin_types_path
      when User
        user_path(current_user)
      end
    end
    def after_sign_out_path_for(resource)
      case resource
      when :admin
        new_admin_session_path
      when :user
        root_path
      end
    end
end
