class ChangeRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :role_id, :integer, null: false
  end
end
