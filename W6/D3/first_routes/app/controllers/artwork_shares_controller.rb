class ArtworkSharesController < ApplicationController

  def index
    if params.has_key?(:artwork_id)
      @artwork_shares = ArtworkShare.where(artwork_id: params[:artwork_id])
    else
      @artwork_shares = ArtworkShare.all
    end

    render json: @artwork_shares
  end

  def create
    artwork_share = ArtworkShare.new()
    if artwork.save
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy

  end

  private
  def artwork_shares_params
    params.require(:artwork_share).permit()
  end
end