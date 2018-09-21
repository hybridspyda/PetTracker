class ChangeUsersName < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	remove_column :users, :real_name, :string
  end
end
