class ChangeDiscountInProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :discount, :float, :default => 0  	
  end
end
