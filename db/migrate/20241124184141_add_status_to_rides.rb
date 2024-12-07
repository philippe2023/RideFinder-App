class AddStatusToRides < ActiveRecord::Migration[8.0]
  def change
    add_column :rides, :status, :integer
  end
end
