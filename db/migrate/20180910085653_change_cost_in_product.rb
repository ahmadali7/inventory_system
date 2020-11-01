class ChangeCostInProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :cost, :float, :default => 0
  end
end
