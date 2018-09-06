class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :rateable, polymorphic: true, index: true
      t.belongs_to :user, index: true
      t.integer :rating

      t.timestamps
    end
  end
end

