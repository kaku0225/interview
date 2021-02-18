class OrdersController < ApplicationController
  before_action :session_required
  before_action :find_cart, only: :create

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find_by(id: params[:order_id])
  end

  def create
    @order = current_user.create_order(
      items: @cart.items,
      email: current_user.email
    )
  end

  private

    def find_cart
      @cart = Cart.find_by(id: params[:id])
    end
end