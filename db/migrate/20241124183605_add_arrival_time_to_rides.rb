class AddArrivalTimeToRides < ActiveRecord::Migration[8.0]
  def change
    add_column :rides, :arrival_time, :datetime
  end
end
