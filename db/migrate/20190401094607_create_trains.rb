class CreateTrains < ActiveRecord::Migration
  def up
    create_table :trains do |t|
      t.string "name", :limit => 25
      t.integer "t_capacity"
      t.timestamps
    end
  end
  
  def down
    drop_table :trains
  end
end
