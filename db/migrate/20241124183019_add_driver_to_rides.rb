class AddDriverToRides < ActiveRecord::Migration[8.0]
  def change
    add_reference :rides, :driver, null: false, foreign_key: { to_table: :users }
  end
end
