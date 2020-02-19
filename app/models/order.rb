class Order < ApplicationRecord
	belongs_to :customer

	has_many :order_products, dependent: :destroy
	accepts_nested_attributes_for :order_products


	enum order_status: {
		入金待ち: 0,
		入金確認: 1,
		製作中: 2,
		発送準備中: 3,
		発送済み: 4,
	}

	enum payment: {
		クレジットカード: 0,
		銀行振り込み: 1,
	}

	validates :postcode, presence: true, format: { with: /\A\d{7}\z/ }

	validates :address, presence: true

	validates :ship_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}

end
