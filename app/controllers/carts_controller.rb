# frozen_string_literal: true

# Here we will write documentation of class.
class CartsController < ApplicationController
  include AddToCartConcern
  def index
    if !user_signed_in?
    else
          @order_item = OrderItem.joins(:order).where(orders: {user_id: current_user.id, status: false}).all 
    end
  end

  def create
    product = Product.find(params[:product_id])
    puts "===================================="
    puts product.inspect
    puts params[:quant]
    if !user_signed_in?
      notice = add_to_cookies(product, params[:quant].to_i)
    else
      notice = add_order(product.id, params[:quant].to_i, current_user.id)
    end
    respond_to do |format|
      format.js {flash.now[:notice] = notice}
    end
  end

  def destroy
    if !user_signed_in?
      product = Product.find(params[:id])
      x = JSON.parse(cookies[:cart])
      x.each do |p|
        if p['product_id'] ==  product.id
          x.delete_if { |h| h['product_id'] == product.id }
        end
      end
      cookies[:cart] = JSON.generate(x)
    else
      order_item = OrderItem.find(params[:id])
      order_item.order.items -= order_item.quantity
      order_item.order.total_bill -= order_item.total
      order_item.order.save
      order_item.destroy
    end
    redirect_to carts_path, notice: 'Item successfully deleted'
  end

  def add_to_cookies(product, quantity)

    notice = 'No more items available against this product'
    puts notice
    arr = []
    if cookies[:cart].nil?
      if product.quantity.positive?
        arr << { product_id: product.id, quantity: quantity }
        cookies[:cart] = JSON.generate(arr)
        notice = 'Item successfully added to cart.'
      else
        return notice
      end
    else
      x = JSON.parse(cookies[:cart])
      status = true
      x.each do |p|
        if p['product_id'] == product.id && p['quantity'] >= product.quantity
          notice = 'No more items available against this product'
          status = false
        elsif p['product_id'] == product.id && p['quantity'] <= product.quantity - quantity
          p['quantity'] += quantity
          status = false
          notice = 'Item successfully added to cart.'
        elsif p['product_id'] == product.id
          status = false
        end
      end
      if status == true && product.quantity.positive?
        x << { product_id: product.id, quantity: quantity }
        notice = 'Item successfully added to cart.'
      end
      cookies[:cart] = JSON.generate(x)
      puts notice
    end
    return notice
  end
end
