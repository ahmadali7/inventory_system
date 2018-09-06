class User < ApplicationRecord
	has_many :orders
	has_many :comments
	before_create :auto_fill_data
	attr_accessor :country, :province, :district, :city	
	
	
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


	def auto_fill_data
		self.address = [city, district, province, country].join(", ")
		self.role = "buyer"
	end

end
