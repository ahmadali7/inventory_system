class User < ApplicationRecord
	has_many :orders
	has_many :comments
	has_many :photos, as: :imageable
	has_many :rating
	validates_associated :orders, :comments, :rating, :photos
	validates :first_name, :last_name, presence: true# :images, :address, presence: true
	before_create :auto_fill_data
	attr_accessor :country, :province, :district, :city	
	
	accepts_nested_attributes_for :photos

	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


	def auto_fill_data
		self.address = [city, district, province, country].join(", ")
		self.role = "buyer"
	end

end
