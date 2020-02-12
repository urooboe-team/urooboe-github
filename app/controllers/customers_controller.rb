class CustomersController < ApplicationController
  def show
   @customer = Customer.find(params[:id])
  end

  def edit
  end

  def withdraw
  end

  def update
  end
end
