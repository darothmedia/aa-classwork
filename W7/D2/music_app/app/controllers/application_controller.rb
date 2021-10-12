class ApplicationController < ActionController::Base

    def login(user)
      session[:session_token] = user.reset_session_token!
    end

    def current_user
      @current_user ||= User.find_by(session_token: session[:session_token])
    end
  
    def logged_in?
      current_user
    end
end
