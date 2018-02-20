class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.string :appointment, null: false
      t.string :email, null: false
      t.string :name, null: false
      t.string :telephone, null: false

      t.timestamps
    end
  end
end
