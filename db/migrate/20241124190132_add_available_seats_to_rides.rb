class AddAvailableSeatsToRides < ActiveRecord::Migration[8.0]
  def change
    add_column :rides, :available_seats, :integer
  end
end
