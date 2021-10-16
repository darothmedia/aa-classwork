class ApplicationController < ActionController::Base
  #CRLLL

  helper_method :current_user, :is_logged_in?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def is_logged_in?
    current_user ? true : false
  end

  def require_logged_in
    redirect_to new_session_url unless is_logged_in?
  end

end
