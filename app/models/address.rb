class Address < ApplicationRecord
	belongs_to :customer
    enum address_status: {
		ご自身の住所: 0,
		登録先: 1,
		新しい住所: 2,
	}

	validates :postcode, presence: true, format: { with: /\A\d{7}\z/ }
	validates :address, presence: true
	validates :ship_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }



	def information
	 postcode + address + ship_name
	end
end
