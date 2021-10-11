class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login_user(@user) 
      redirect_to cats_url
    else
     render json: ['Invalid username or password.'] 
    end 
  end

  def destroy
    if current_user
      @current_user.reset_session_token!
      session[:session_token] = ""
    end
  end
end
