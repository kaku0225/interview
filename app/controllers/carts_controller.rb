class CartsController < ApplicationController
  before_action :session_required
  before_action :find_cart, only: :show
  before_action :find_product, only: :create
  before_action :current_cart, only: :create

  def show; end

  def create
    # stock = (@product.stock.value - cart_params[:number].to_i)
    # @product.stock.update(value: stock)
    @stock.update(value: @stock.value - cart_params[:number].to_i)
    @cart.items.create(product_id: @product.id, quantity: cart_params[:number])
  end

  private

    def find_cart
      @cart = current_user.cart || current_user.build_cart
      # @cart = Cart.find_by(id: params[:id])
    end

    # def find_product
    #   @product = Product.find_by(id: params[:product_id])
    # end

    def find_stock
      @stock = Stock.find_by!(product_id: params[:product_id])
    end

    def current_cart
      @cart ||= Cart.first_or_create(user_id: current_user.id)
    end

    # params = { 'number' => 2 }
    def cart_params
      params.permit(:number)
    end
end