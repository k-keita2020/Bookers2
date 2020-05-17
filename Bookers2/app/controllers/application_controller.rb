class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :configure_permitted_paramaters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end


  protected
  def configure_permitted_paramaters
    #ユーザー登録の際にデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  
end
