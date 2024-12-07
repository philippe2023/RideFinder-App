# db/migrate/xxxxxxxxxx_add_role_to_users.rb
class AddRoleToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :string, default: "rider" # Default role is "rider"
  end
end
