class AddIndexToUser < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, name: "index_users_on_email"
  end
end
