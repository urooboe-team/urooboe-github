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
  end

  def edit
  end

  def update
  end
  private
    def product_params
        params.require(:product).permit(:product_name,:product_description,:genre_name,:unit_price,:product_image_id,:sale_status)
    end
end
