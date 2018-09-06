json.extract! product, :id, :name, :category, :price, :cost, :discount, :quantity, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
