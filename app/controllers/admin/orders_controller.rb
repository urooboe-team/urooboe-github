class Admin::OrdersController < ApplicationController
  def top
    # @order = Order.find(params[:id])
    # @order = Order.find_by(id: params[:id])
    # # 変数@likes_countを定義
    # @likes_count = Like.where(order_id: @order.id).count
  end

  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	order.update(order_params)
  	redirect_to admin_orders_path
  end

  private
  def order_params
  	params.require(:order).permit(:order_status, :production_status)
  end
end
