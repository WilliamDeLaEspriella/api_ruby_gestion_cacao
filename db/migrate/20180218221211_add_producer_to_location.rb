class AddProducerToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :producer_id, :integer
  end
end
