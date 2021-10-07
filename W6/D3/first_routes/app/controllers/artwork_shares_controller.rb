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
    artwork_share = ArtworkShare.new(artwork_shares_params)
    if artwork_share.save
      render json: artwork_share
    else 
      render json: artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.delete
    render json: artwork_share
  end

  private
  def artwork_shares_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end