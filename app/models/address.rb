class Address < ApplicationRecord
	belongs_to :customer
    enum address_status: {
		ご自身の住所: 0,
		登録先: 1,
		新しい住所: 2,
	}

	def information
	 postcode + address + ship_name
	end
end
