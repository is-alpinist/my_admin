class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
   redirect_to login_url, notice: "Not authorized" if current_user.nil?
  end

  def admin_user
    if
   @admin_user = current_user.admin?
    else
  redirect_to login_url, notice: "Not authorized"
    end
  end
  helper_method :admin_user
  
end
