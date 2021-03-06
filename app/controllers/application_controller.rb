class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, :if => :devise_controller?

  def user_can_view_private_page?
    # TODO: Change url path to root_url once made
    redirect_to user_path(current_user.id), :alert => 'You cannot access that page.' if current_user.id != params[:user_id]
  end

  def user_can_do_private_action?(user_id)
    # TODO: Change url path to root_url once made
    redirect_to user_path(current_user.id), :alert => 'You cannot perform that action.' if current_user.id != user_id
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, :keys => [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :email, :password, :password_confirmation, :remember_me])
  end
end
