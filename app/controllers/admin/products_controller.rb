class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genre = Genre.new

  end

  def index
    @products = Product.all

  end

  def show
     @product = Product.find(params[:id])


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
    redirect_to admin_products_path
  end
  private
    def product_params
        params.require(:product).permit(:product_name,:product_description,:genre_name,:unit_price,:product_image,:sale_status,:genre_id)
    end
end
