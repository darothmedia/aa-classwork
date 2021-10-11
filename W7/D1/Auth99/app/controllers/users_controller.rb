class UsersController < ApplicationController
  
  def new
    render :new 
  end

  def create
    new_user = User.new(user_params)

    if new_user.save
      redirect_to cats_url 
    else
      redirect_to cats_url 
    end

  end

  def user_params
    params.permit(:user_name, :password)
  end


end
