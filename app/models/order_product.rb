class OrderProduct < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :product
end

