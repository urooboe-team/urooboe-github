class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
 end
  def top

     # @order = Order.find_by(id: params[:id])
     # 変数@likes_countを定義
     #@order_count = order.where(order_id: @order.id).count

     @orders = Order.where(created_at: Date.today).count
     #User.where("created_at between '#{Date.yesterday} 0:00:00' and '#{Date.yesterday} 23:59:59'")

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
