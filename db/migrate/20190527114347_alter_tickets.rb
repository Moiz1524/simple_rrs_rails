class AlterTickets < ActiveRecord::Migration[5.2]
  def up
    add_column("tickets", "start_time", :datetime)
    add_column("tickets", "end_time", :datetime)
  end
  
  def down
    remove_column("tickets", "start_time")
    remove_column("tickets", "end_time")
  end
end
