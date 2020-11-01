module CartsHelper
	def add_order(p_id, q, c_id)
	  	product = Product.find(p_id)
	  	@order = Order.find_by(user_id: c_id, status: false)
	  	if @order.nil?
			@order = Order.new
			@order.user_id = c_id
		end
		@order.items += q
		@order.discount += product.discount
		@order.total_bill += product.price		
		notice = nil
	  	@order_item = OrderItem.find_by(order_id: @order.id, product_id: product.id)
	  	if @order_item.nil?
	  		@order_item = OrderItem.new
	  	end
		if @order_item.quantity <= product.quantity
			@order.save
			@order_item.product_id = product.id
			@order_item.order_id = @order.id
			@order_item.quantity += q
			@order_item.total = @order_item.quantity * product.price
			@order_item.discount += product.discount
			@order_item.save
			return notice = 'Product successfully added to Cart.'
		else
			return notice = 'No more items available of this product.'
		end
	end
end
