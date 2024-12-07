class RemoveUserIdFromRides < ActiveRecord::Migration[8.0]
  def change
    remove_column :rides, :user_id, :bigint
  end
end
