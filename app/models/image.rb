class Image < ApplicationRecord
	belongs_to :imageable, polymorphic: true
	before_save :validate_images_count

	def validate_images_count
		count = Image.where(imageable_id: self.imageable_id, imageable_type: self.imageable_type).count #(:imageable.id)
		if count>5
			throw :abort
		end

	end

end
