class ChangeDiscountInOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :discount, :float, :default => 0
  end
end
