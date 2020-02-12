class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genre = Genre.new

  end

  def index
    @products = Product.all
    # @genre = Genre.all
  end

  def show
     @product = Product.find(params[:id])
    # @genre = Genre.find(params[:id])

  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    #binding.pry
    redirect_to admin_product_path
  end
  private
    def product_params
        params.require(:product).permit(:product_name,:product_description,:genre_name,:unit_price,:product_image_id,:sale_status,:genre_id)
    end
end
