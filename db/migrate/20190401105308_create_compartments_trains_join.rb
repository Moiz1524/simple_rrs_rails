class CreateCompartmentsTrainsJoin < ActiveRecord::Migration
  def up
    create_table :compartments_trains, :id => false do |t|
      t.integer "compartment_id"
      t.integer "train_id"
    end
    add_index("compartments_trains", ["compartment_id", "train_id"] )
  end
  
  def down
    drop_table :compartments_trains
  end
end
