class SessionsController < ApplicationController
  def new

  end
  
  def create
    @current_user = User.find_by(:session_token = session[:session_token])
    @current_user.reset_session_token!
    redirect_to user_url(@current_user)
  end

  def destroy
    @current_user.reset_session_token!
    @current_user.save!
    @current_user.session_token
  end
end
