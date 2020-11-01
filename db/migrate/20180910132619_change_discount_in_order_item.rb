class ChangeDiscountInOrderItem < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_items, :discount, :float, :default => 0
  end
end
