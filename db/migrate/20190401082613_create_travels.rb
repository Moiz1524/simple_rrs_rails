class CreateTravels < ActiveRecord::Migration
  def up
    create_table :travels do |t|
      t.integer "total_seats"
      t.integer "ava_seats"
      t.integer "train_id"
      t.integer "route_id"
      t.timestamps
    end
  end
  
  def down
    drop_table :travels
  end
end
