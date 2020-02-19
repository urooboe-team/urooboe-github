class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!

  def top




     # @orders = Order.where(created_at: Date.today).count


     # @order = Order.find(params[:id])
     # @order = Order.find_by(id: params[:id])
    # # 変数@likes_countを定義
    # @likes_count = Like.where(order_id: @order.id).count
    # @orders = Order.all
    # @orders = Order.all
    # @order = Order.where(created_at: 1.day.ago.all_day)

    range = Date.today.beginning_of_day..Date.today.end_of_day
    @order = Order.where(created_at: range)

  end

  def index
  	@orders = Order.all

  end

  def show
  	@order = Order.find(params[:id])
    @order_products = OrderProduct.all
  end

  def update
    # @order = OrderProduct.new()
  	@order = Order.find(params[:id])

    # @order_product = OrderProduct.find(@order.order_products_id)

     if params[:order][:order_status] == "入金確認"
       @order.order_products.update(production_status: '制作待ち')
    end
  	@order.update(order_params)
  	redirect_to admin_orders_path
  end

  private
  def order_params
  	params.require(:order).permit(:order_status)
  end
end
