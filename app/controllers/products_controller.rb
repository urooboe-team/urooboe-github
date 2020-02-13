class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	@product = Product.where(genre_id: params[:id] )
  end

  def show
  	@product = Product.find(params[:id])
  	@products = Product.all
  	@cart_item = Cart_item.new
  end
end
