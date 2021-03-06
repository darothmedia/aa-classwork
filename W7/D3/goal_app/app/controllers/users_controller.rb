class UsersController < ApplicationController
  before_action :require_logged_in, except: [:new, :create]
  before_action :require_logged_out, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end
  
  # if we don't define index, it will automatically render :index
  def index
    @users = User.all
    render :index
  end
  
  def edit 
    @user = User.find(params[:id])
    render :edit
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def create
    @user = User.new(user_params)
    if @user.save #runs user.save. If true, then:
      login(@user)
      redirect_to user_url(@user)
    else
      # render json: user.errors.full_messages, status: 422 #422: unprocessable entity
      flash.now[:errors] = @user.errors.full_messages
      # flash[:errors] = @user.errors.full_messages 
      render :new, status: 422
    end
  end
  
  def update
    user = User.find(params[:id])
  
    if user.update(user_params)
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages, status: 422
    end 
  end
  
  # if destroy is not defined, there is no view so it will do nothing
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
    #password_digest and session_token are set by default in our model
  end
  
end