class CartItem < ApplicationRecord

	belongs_to :customer
	belongs_to :product

	def add_tax
    self.price = (cart_item.product.unit_price * * 1.1).round
  end
end
