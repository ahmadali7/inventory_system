class Product < ApplicationRecord
	has_many :order_items
	has_many :orders, :through => :order_items
	has_many :comments
	has_many :ratings, as: :rateable
	has_many :images, as: :imageable
	validates_associated :order_items, :comments, :ratings, :images
	validates :name, :price, presence: true

end
