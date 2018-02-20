class CreateAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :associations do |t|
      t.integer :user_id ,  index: true
      t.string :description , null: false
      t.integer :location_id
      t.integer :manager_id
      t.string :name, null: false

      t.timestamps
    end
  end
end
