class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :order, index: true

      t.float :discount
      t.integer :quantity
      t.float :total

      t.timestamps
    end
  end
end
