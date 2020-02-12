class AddressesController < ApplicationController
  def index
    @ship_address_new = Address.new
    @ship_address = Address.all
  end

  def edit
    @ship_address = Address.find(params[:id])
  end

  def create
    ship_address = Address.new(address_params)
    ship_address.customer_id = current_customer.id
    ship_address.save
    redirect_to '/addresses'
  end

  def updete
    @ship_address = Adress.find(params[:id])
    @ship_address.update(address_params)
    redirect_to  '/addresses'
  end

  def destroy
    @ship_address = Address.find(params[:id])
    @ship_address.destroy
    redirect_to '/addresses'
  end

  private
    def address_params
        params.require(:address).permit(:postcode, :address, :ship_name)
  end

end