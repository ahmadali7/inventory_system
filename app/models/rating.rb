class Rating < ApplicationRecord
	belongs_to :rateable, polymorphic: true
	belongs_to :user
	validates :rating, presence: true
	validates :rating, numericality: { only_integer: true, greated_than: 0 }
	before_save :validate_duel_rating

	def validate_duel_rating
		count = Rating.where(rateable_id: self.rateable_id, rateable_type: self.rateable_type, user_id: self.user_id).count #(:imageable.id)
		puts count
		if count>0
			throw :abort
		end

	end
end



