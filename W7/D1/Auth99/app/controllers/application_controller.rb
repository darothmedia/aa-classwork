class ApplicationController < ActionController::Base
  helper_method :current_user

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user(user) 
    session[:session_token] = user.reset_session_token!
  end 

  def require_logged_in
    redirect_to new_session_url unless logged_in? 
  end

  

end
