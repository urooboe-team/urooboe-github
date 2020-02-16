class OrdersController < ApplicationController
  def new
    @address = Address.new
    @my_address = current_customer

  end

  def thanks
  end

  def index

  end

  def show
  end

  def create
  end

  def comfirm
    if params["payment"] == "0"
      @msg_p = "クレジットカード"

    elsif params["payment"] == "1"
      @msg_p = "銀行振り込み"

    end


    if params["addresses"] == "0"
      @number = "current_address"
      @msg_a = current_customer

    elsif params["addresses"] == "1"
      @number = "other_address"
      @msg_b = Address.find(params["choice"])

    elsif params["addresses"] == "2"
      @number = "other_address"
      @msg_b = Address.new(postcode: params[:postcode], address: params[:address], ship_name: params[:ship_name], customer_id: current_customer.id)
      @msg_b.save

    end
   end

# private
#   def address_params
#     params.require(:address).permit(:postcode, :address, :ship_name)
#   end
end
