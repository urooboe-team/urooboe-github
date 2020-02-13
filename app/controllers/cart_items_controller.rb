class CartItemsController < ApplicationController
before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def index
     @cart_item = current_customer.cart_item.id
  end

  def create
  	if @cart_item.blank?
       @cart_item = current_customer.cart_items.build(product_id: params[:product_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def updete
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

 private

  def setup_cart_item
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end

end

