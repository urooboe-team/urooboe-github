class Product < ApplicationRecord

    has_many :customers,  through: :cart_items
    has_many :cart_items, dependent: :destroy

    has_many :order_products, dependent: :destroy
	belongs_to :genre
	attachment :product_image

end
