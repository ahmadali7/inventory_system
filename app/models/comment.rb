class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :product
	has_many :ratings, as: :rateable
	has_many :replies, class_name: "Comment", foreign_key: "reply_id"
	validates_associated :ratings, :replies
	validates :comment, presence: true	
	before_save :validate_nested_comments

	def validate_nested_comments

		if self.reply_id
			status = Comment.find_by(id: self.reply_id).is_reply
			if status
				throw :abort
			end
		end
	end
	

	def is_reply
		reply_id.present?
	end
end
