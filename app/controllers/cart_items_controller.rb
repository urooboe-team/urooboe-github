class CartItemsController < ApplicationController

  def index
     @cart_item = current_customer.cart_item.id
  end

  def create
    if 
      cart_item == where(customer_id: current_customer, cart_item: id)
      cart_item_user_id = cart_item.current_customer.id
      cart_item_product = Product.find(params[:id])
      cart_item_quantity += params[:quantity].to_i
      cart_item.update
      redirect_to '/cart_items'
    else
      cart_item = CartItem.new
      cart_item_user_id = cart_item.current_customer.id
      cart_item_product = Product.find(params[:id])
      cart_item.save
      cart_item.quantity += params[:quantity].to_i
      cart_item.save
      redirect_to '/cart_items'
    end
  end


  def updete
    cart_item.quantity += params[:quantity].to_i
    cart_item.save
    redirect_to '/cart_items'
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to '/addresses'
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:quantity)
  end
end

