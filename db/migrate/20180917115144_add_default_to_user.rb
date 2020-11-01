class AddDefaultToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :role, :string, :default => "buyer"
    remove_column :users, :avatars, :json

  end
end
