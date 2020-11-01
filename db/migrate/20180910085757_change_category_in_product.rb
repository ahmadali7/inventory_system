class ChangeCategoryInProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :category, :string, :default => "general"
  end
end
