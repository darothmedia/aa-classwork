class UsersController < ApplicationController
  
  def new
    render :new 
  end

  def create
    new_user = User.new(params)

    if new_user.save
      redirect_to cats_url 
    else
      redirect_to cats_url 
    end

  end


end
