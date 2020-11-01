class ChangeTotalBillInOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :total_bill, :float, :default => 0
  end
end
