class OrdersController < ApplicationController
  def new
    @address = Address.new
    @order = Order.new



  end

  def thanks
  end

  def index
    @orders = Order.all
    @order_products = OrderProduct.all
    @order = current_customer.id
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.all
    # @order_product = OrderProduct.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id


    if @order.save
    @carts = current_customer.cart_items
    @carts.each do |cart|

      item = OrderProduct.new(product_id: cart.product_id, order_id: @order.id,unit_price: cart.product.unit_price, quantity: cart.quantity)
      item.save

    end
      redirect_to thanks_path


    else
    end

  end

  def comfirm
      @carts = current_customer.cart_items
      @order = Order.new(order_params)
      @order.payment = params["payment"].to_i



    if params["addresses"] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.ship_name = current_customer.last_name + current_customer.first_name


    elsif params["addresses"] == "1"

      @order.postcode = Address.find(params[:address][:id]).postcode
      @order.address = Address.find(params[:address][:id]).address
      @order.ship_name = Address.find(params[:address][:id]).ship_name


    elsif params["addresses"] == "2"

      address = Address.new
      address.customer_id = current_customer.id
      address.postcode = @order.postcode
      address.address = @order.address
      address.ship_name = @order.ship_name
      address.save

      @order.postcode = address.postcode
      @order.address = address.address
      @order.ship_name = address.ship_name

    end
   end

private
  def order_params
   params.require(:order).permit(:postcode, :address, :ship_name, :total_fee)
  end
  def address_params
   params.require(:address).permit(:id, :postcode, :address, :ship_name)
  end

#   def address_params
#     params.require(:address).permit(:postcode, :address, :ship_name)
  # end
end

  
