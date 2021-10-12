class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash[:errors] << @band.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit
    @band = Band.find_by(name: params[:name])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update

  end

  def destroy
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
