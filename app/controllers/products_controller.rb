class ProductsController < ApplicationController
  def index
  	 @products = Product.all
  	 # @product = Product.where(genre_id: params[:id] )
  	 # @products = Product.where(active: true)
  	 @product = Genre.find_by(genre_name: params[:genre_name]).products

  end

  def show
  	@product = Product.find(params[:id])
  	@products = Product.all
  	@cart_item = CartItem.new
  end
  def product_params
        params.require(:product).permit(:genre_name,:genre_id)
    end
end
