class UsersController < ApplicationController
  def index
    render plain: "Hello World!"
  end

  def create
    # user = User.new(
    #   params.require(:user).permit(:username, :email, :age)
    # )
    # user.save
    render json: user
  end

  def show
    render json: params
  end
end