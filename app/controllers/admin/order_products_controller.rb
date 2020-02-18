class Admin::OrderProductsController < ApplicationController
	def update
    @order_product = OrderProduct.find(params[:id])

    #@order_product.production_status = params[:order_product][:production_status]
    @order = Order.find(@order_product.order_id)

     if params[:order_product][:production_status] == '製作中'
       @order.update(order_status: '製作中')
     else
       params[:order_product][:production_status] == '制作完了'
       @order.update(order_status: '発送準備中')
    end

    # @order_product.save
    @order_product.update(order_product_params)
    redirect_to admin_orders_path
    end
    private
    def order_product_params
  	params.require(:order_product).permit(:production_status)
    end
end
