class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum production_status: {	着手不可: 0,	制作待ち: 1,	製作中: 2, 制作完了: 3	}

	def add_tax
    self.unit_price = (unit_price * 1.1).round
  end
end

