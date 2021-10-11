class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      @user.reset_session_token!
      redirect_to cats_url
    else
      redirect_to session_url
    end 
  end

  def destroy
    if current_user
      @current_user.reset_session_token!
      session[:session_token] = ""
    end
  end
end
