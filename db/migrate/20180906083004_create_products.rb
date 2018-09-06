class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float :price
      t.float :cost
      t.float :discount
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
