class ApplicationController < ActionController::Base
  helper_method :current_user # allows this method to be used in the view

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
