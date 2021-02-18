class FavoritesController < ApplicationController
  before_action :session_required

  def index
    @products = current_user.fav_products
  end

  def create
    current_user.fav_products.create(product_id: params[:id], note: note_params[:note])
    @note = note_params[:note]
  end

  private

    def note_params
      params.permit(:note)
    end
end