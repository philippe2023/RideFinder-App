class CreateRides < ActiveRecord::Migration[8.0]
  def change
    create_table :rides do |t|
      t.string :departure_location
      t.string :arrival_location
      t.datetime :departure_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
