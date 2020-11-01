class RemoveClientFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :reply, foreign_key: false
  end
end
