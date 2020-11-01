class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
  	change_column :comments, :reply_id, :integer, :null => true
  end
end
