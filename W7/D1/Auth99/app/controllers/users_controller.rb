class UsersController < ApplicationController
  # before_action :require_logged_in 

  def new
    render :new 
  end

  def create
    @new_user = User.new(user_params)
    
    if @new_user.save 
      login_user(@new_user) 
      redirect_to cats_url 
    else
      render json: @new_user.errors.full_messages, status: 422 
    end
  end

  def user_params
    params.require(:user).permit(:user_name, :password) 
  end


end
