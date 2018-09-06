class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :product
	has_many :ratings, as: :rateable
	has_many :subordinates, class_name: "Comment", foreign_key: "reply_id"
	belongs_to :reply, class_name: "Comment"
end
