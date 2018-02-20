class AddAssociationToProducer < ActiveRecord::Migration[5.1]
  def change
    add_column :producers, :association_id, :integer
  end
end
