class Photo < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :imageable, polymorphic: true
	validates :image, presence: true
	before_save :validate_images_count
 
	def validate_images_count
		count = Photo.where(imageable_id: self.imageable_id, imageable_type: self.imageable_type).count #(:imageable.id)
		if count>4
			Photo.last()
			puts count
			throw :abort

		end

	end

end
