class CartItemsController < ApplicationController

  def index
     @cart_items = current_customer.cart_items
  end

  def create
    cart_item = CartItem.find_by(customer_id: current_customer,product_id: cart_item_params[:product_id])
    if cart_item == nil
       cart_item = CartItem.new(cart_item_params)
       cart_item.customer_id = current_customer.id
       cart_item.save
       redirect_to '/cart_items'
    else
       cart_item.quantity += cart_item_params[:quantity].to_i
       cart_item.save
       redirect_to '/cart_items'
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to '/cart_items'
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to '/cart_items'
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:product_id,:quantity)
  end
end

