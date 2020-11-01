class RemoveImageFromPhoto < ActiveRecord::Migration[5.2]
  def change
  	    remove_column :photos, :image, :string
  end
end
