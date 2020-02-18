class OrdersController < ApplicationController
  def new
    @address = Address.new
    @order = Order.new



  end

  def thanks
  end

  def index

  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.total_fee = 

    if @order.save


    @carts = current_customer.cart_items
    @carts.each do |cart|
      item = OrderProduct.new(product_id: cart.product_id, order_id: @order.id,
             unit_price: cart.product.unit_price, quantity: cart.quantity)
      item.save
    end
    redirect_to thanks_path

    else
    end

  end

  def comfirm
      @carts = current_customer.cart_items
      @order = Order.new(order_params)
      pp @order
    # if params["payment"] == "0"
      @order.payment = params["payment"].to_i

    # elsif params["payment"] == "1"
    #   @msg_p = "銀行振り込み"


    # end


    if params["addresses"] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.ship_name = current_customer.last_name + current_customer.first_name


    elsif params["addresses"] == "1"
      # @number = "other_address"
      @order.postcode = Address.find(params[:address][:id]).postcode
      @order.address = Address.find(params[:address][:id]).address
      @order.ship_name = Address.find(params[:address][:id]).ship_name


    elsif params["addresses"] == "2"
      # @number = "other_address"
       #address = Address.new(order_params
      #postcode: params[][:postcode], address: params[:address], ship_name: params[:ship_name], customer_id: current_customer.id)

      #@order.postcode = address.postcode
      #@order.c = address.addresΩ
      address = Address.new
      address.postcode = @order.postcode
      address.address = @order.address
      address.ship_name = @order.ship_name
      adress.save

    end
   end

private
  def order_params
   params.require(:order).permit(:postcode, :address, :ship_name)
  end
  def address_params
   params.require(:address).permit(:id)
  end

#   def address_params
#     params.require(:address).permit(:postcode, :address, :ship_name)
  # end
end

  
