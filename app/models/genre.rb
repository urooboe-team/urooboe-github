class Genre < ApplicationRecord
	has_many :products, dependent: :destroy
	validates :genre_name,presence: true
	validates :display,presence: true
end
