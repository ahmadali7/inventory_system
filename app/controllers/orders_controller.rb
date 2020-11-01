class OrdersController < ApplicationController
	def index
		@orders = Orders.all
	end

	def show() end	

	def new
		@order = Order.new
	end

	def create() end
end
