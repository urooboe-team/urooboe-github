class HomesController < ApplicationController
  def about
  end

  def top
  	@products = Product.all
  	
  end
end
