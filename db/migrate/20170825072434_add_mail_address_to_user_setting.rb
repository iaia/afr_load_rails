class AddMailAddressToUserSetting < ActiveRecord::Migration[5.0]
  def change
    add_column :user_settings, :mail_address, :string
  end
end
