class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.integer :items
      t.float :total_bill
      t.float :discount

      t.timestamps
    end
  end
end
