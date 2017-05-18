class ChangeUserSetting < ActiveRecord::Migration[5.0]
  def change
    change_column :user_settings, :is_tweet, :boolean, null: false, default: true
    change_column :user_settings, :is_post_on_facebook, :boolean, null: false, default: true
  end
end
