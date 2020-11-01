# frozen_string_literal: true

# ProdctService
class ProductServices
  def self.build(p_params, parm)
    photo = []
    @product = Product.new(p_params)
    parm.each do |a|
      photo << @product.photos.build(image: a)
    end
    if photo[5].nil?
      @product.save
      photo.map(&:save)
      return true
    else
    	return false
    end
  end


  def self.add_to_cookies(product, quantity)

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

