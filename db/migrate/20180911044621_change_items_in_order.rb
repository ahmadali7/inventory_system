class ChangeItemsInOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :items, :integer, :default => 0
  end
end
