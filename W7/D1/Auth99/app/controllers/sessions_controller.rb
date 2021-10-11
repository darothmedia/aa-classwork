class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      
    else 

    end 
    redirect_to cats_url
  end

  def destroy
  end
end
