class AddColumnToUserSetting < ActiveRecord::Migration[5.0]
  def change
    add_column :user_settings, :apply_editor_permission, :boolean
  end
end
