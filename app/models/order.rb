class Order < ApplicationRecord
	belongs_to :customer
	bolongs_to :order_pruduct
end
