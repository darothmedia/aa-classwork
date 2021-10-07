class ArtworksController < ApplicationController

  def index
    if params.has_key?(:user_id)
      @artworks = 
        Artwork
          .joins(:artwork_shares)
          .where('artist_id = ? OR viewer_id = ?', params[:user_id], params[:user_id])
    end

    render json: @artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.delete
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end

end