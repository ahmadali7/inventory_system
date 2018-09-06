class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.references :reply, index: true
      t.text :comment

      t.timestamps
    end
  end
end
