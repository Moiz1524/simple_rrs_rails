class CreateRoutes < ActiveRecord::Migration
  def up
    create_table :routes do |t|
      t.integer "source_id"
      t.integer "dest_id"
      t.integer "fare"
      t.timestamps
    end
  end
  
  def down
    drop_table :routes
  end
end
