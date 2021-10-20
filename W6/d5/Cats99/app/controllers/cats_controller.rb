class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index 
  end

  def show
    @c = Cat.find_by(id: params[:id])
    render :show 
  end

  def new 
    render :new 
  end

  def create
    cat = Cat.new(cat_params)

    if cat.save
      redirect_to cat_url(cat)
    else
      render json: cat.errors.full_messages, status: 422
    end
  end


  private
  def cat_params
    params.require(:cat).permit(:birth_date, :name, :sex, :description, :color)
  end
end
