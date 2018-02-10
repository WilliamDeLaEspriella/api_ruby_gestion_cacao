class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :contact
      t.string :password_digest
      t.integer :role
      t.timestamps
    end
  end
end
