class Product < ApplicationRecord
	enum sale_status: { 販売中: true, 売り切れ: false }
    has_many :customers,  through: :cart_items
    has_many :cart_items, dependent: :destroy

    has_many :order_products, dependent: :destroy
	belongs_to :genre
	attachment :product_image


# def add_tax
    # self.price = (cart_item.product.unit_price * * 1.1).round
  # end




   def add_tax(product_id)

     tax_included = Product.find(product_id).unit_price.to_i*1.1
     add_tax = tax_included.to_i
   end

  # def add_tax
  #   self.add_tax = unit_price.to_i * 1.1.to_i
  # end
end