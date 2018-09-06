class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :items
      t.float :total_bill
      t.float :discount

      t.timestamps
    end
  end
end
