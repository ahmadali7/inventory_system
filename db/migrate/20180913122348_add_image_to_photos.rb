class AddImageToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :image, :json
  end
end
