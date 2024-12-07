class AddPricePerSeatToRides < ActiveRecord::Migration[8.0]
  def change
    add_column :rides, :price_per_seat, :decimal
  end
end
