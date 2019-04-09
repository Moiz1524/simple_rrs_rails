class CreateCompartments < ActiveRecord::Migration
  def up
    create_table :compartments do |t|
      t.string "name", :limit => 25
      t.integer "capacity"
      t.timestamps
    end
  end
  
  def down
    drop_table :compartments
  end
end
