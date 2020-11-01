class ChangeStatusInOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :status, :boolean, :default => false
  end
end
