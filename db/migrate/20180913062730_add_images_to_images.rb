class AddImagesToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :images, :json
  end
end
