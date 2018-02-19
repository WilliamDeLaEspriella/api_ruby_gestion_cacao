class ChangeUserRole < ActiveRecord::Migration[5.1]
  def up
    change_table :users do |t|
      t.change :role, :integer, default: 0
    end
  end
 
  def down
    change_table :users do |t|
      t.change :role, :string, default: "producer"
    end
  end
end
