class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :passenger, null: false, foreign_key: { to_table: :users } # Explicitly reference the users table
      t.references :ride, null: false, foreign_key: true
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end
