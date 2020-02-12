class Product < ApplicationRecord
	 enum sale_status: { 販売中: true, 売り切れ: false }
    has_many :customers,  through: :cart_items
    has_many :cart_items, dependent: :destroy

    has_many :order_products, dependent: :destroy
	belongs_to :genre
	attachment :product_image

end
