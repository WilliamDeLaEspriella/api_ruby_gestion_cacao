class CreateProducers < ActiveRecord::Migration[5.1]
  def change
    create_table :producers do |t|
      t.string :name ,null: false
      t.integer :location_id
      t.integer :user_id
      t.index :user_id
      t.timestamps
    end
  end
end
