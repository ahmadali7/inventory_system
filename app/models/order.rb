class Order < ApplicationRecord
	has_many :order_items
	has_many :products, :through => :order_items
	belongs_to :user
	validates_associated :order_items
end
