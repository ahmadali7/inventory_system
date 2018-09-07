class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :product
	has_many :ratings, as: :rateable
	has_many :replies, class_name: "Comment", foreign_key: "reply_id"
	before_save :validate_nested_comments



	def validate_nested_comments
		comment = Comment.select(:reply_id).where(id: self.reply_id)
		puts "Here is your comment"
		#puts comment

	end
end
