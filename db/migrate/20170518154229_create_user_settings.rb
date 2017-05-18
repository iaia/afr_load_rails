class CreateUserSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_settings do |t|
      t.boolean :is_tweet
      t.boolean :is_post_on_facebook

      t.timestamps
    end
  end
end
