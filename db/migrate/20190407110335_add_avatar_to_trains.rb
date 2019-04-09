class AddAvatarToTrains < ActiveRecord::Migration
  def up
    add_column "trains", "avatar", :string
  end
  
  def down
    remove_column "trains", "avatar"
  end
end
