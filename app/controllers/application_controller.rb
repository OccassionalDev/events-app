class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, :if => :devise_controller?

  def verify_event_host; end

  def verify_current_user_can_view_account_settings
    redirect_to user_session, :alert => 'You cannot access that page.' if current_user.id != params[:user_id]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, :keys => [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :email, :password, :password_confirmation, :remember_me])
  end
end
