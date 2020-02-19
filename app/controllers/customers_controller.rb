class CustomersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def withdraw
  end

  def update
   @customer = current_customer
    if  @customer.update(customer_params)
       redirect_to customer_path
    else
   	   render action: :edit
    end
  end

  def destroy
   @customer = current_customer
    if @customer.soft_delete
       redirect_to products_path
    else
    	   render action: :destroy
    end
  end

private
  def customer_params
  	params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :kana_last_name, :kana_first_name, :postcode, :address, :telephone, :member_status)
  end
end
