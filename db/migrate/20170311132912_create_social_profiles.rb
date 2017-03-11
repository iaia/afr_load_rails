class CreateSocialProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :social_profiles do |t|
      t.references :user, foreign_key: true
      t.string :provider, unique: true
      t.string :uid, unique: true
      t.string :name
      t.string :nickname
      t.string :email
      t.string :url
      t.string :image_url
      t.string :description
      t.string :other
      t.string :credentials
      t.string :raw_info

      t.timestamps
    end
  end
end
