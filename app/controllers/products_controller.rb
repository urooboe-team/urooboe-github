class ProductsController < ApplicationController
  def index
    @products = Product.all
  	 if into = params[:genre_name]
  	 @products = Genre.find_by(genre_name: params[:genre_name]).products
    else
     Product.all
     end

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
