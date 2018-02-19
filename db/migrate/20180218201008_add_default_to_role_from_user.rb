class AddDefaultToRoleFromUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role, :string, default: "producer"
  end
end
