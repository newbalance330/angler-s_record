class ApplicationController < ActionController::Base
   # ログインなしで見れるページを指定
   before_action :authenticate_user!,except: [:top, :about]

   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
