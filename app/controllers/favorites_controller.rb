class FavoritesController < ApplicationController
  before_action :session_required

  def my_fav_products
    @products = current_user.fav_products
  end

  def add_fav_products
    current_user.fav_products.create(product_id: params[:id], note: note_params[:note])
    @note = note_params[:note]
  end

  private

    def note_params
      params.permit(:note)
    end
end