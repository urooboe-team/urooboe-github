class Admin::OrderProductsController < ApplicationController
	def update
    @order_product = OrderProduct.find(params[:id])

    #@order_product.production_status = params[:order_product][:production_status]
    @order = Order.find(@order_product.order_id)

    # @order_product.save
    @order_product.update(order_product_params)

    if params[:order_product][:production_status] == '製作中'
      @order.update(order_status: '製作中')
    elsif params[:order_product][:production_status] == '製作完了'
       if @order.order_products.where.not(production_status: "製作完了").count == 0
        @order.update(order_status: '発送準備中')
      end
    end

      # redirect_to admin_order_path(@order_product.id)
      redirect_back(fallback_location: root_path)
  end
  private
  def order_product_params
	  params.require(:order_product).permit(:production_status)
  end
end
