class AlbumsController < ApplicationController
  def new
    @band = Band.find_by(id: params[:band_id])
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
  end

  def destroy
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live)
  end
end
