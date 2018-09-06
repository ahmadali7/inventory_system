class Rating < ApplicationRecord
	belongs_to :comment
	belongs_to :product
	belongs_to :user
end
