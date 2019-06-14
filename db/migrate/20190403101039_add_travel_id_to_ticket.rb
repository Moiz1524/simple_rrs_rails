class AddTravelIdToTicket < ActiveRecord::Migration
  
  def up
    add_column "tickets", "travel_id" , :integer 
  end
  
  def down
    remove_column "tickets", "travel_id"
  end 
  
end
