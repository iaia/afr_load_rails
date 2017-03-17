class AddRoleToOnAir < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role_id, :integer, after: :nickname
  end
end
