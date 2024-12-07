class AddAdditionalInfoToRides < ActiveRecord::Migration[8.0]
  def change
    add_column :rides, :additional_info, :text
  end
end
