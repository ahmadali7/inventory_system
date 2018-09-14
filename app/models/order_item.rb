class OrderItem < ApplicationRecord

	belongs_to :product
	belongs_to :order
	#before_save :show_msg



end