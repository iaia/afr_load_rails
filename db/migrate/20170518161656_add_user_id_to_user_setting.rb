class AddUserIdToUserSetting < ActiveRecord::Migration[5.0]
  def change
    add_column :user_settings, :user_id, :integer, unique: true, null: false
  end
end
