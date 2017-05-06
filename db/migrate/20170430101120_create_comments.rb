class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.string :user_name
      t.integer :provider_id
      t.datetime :commented_time
      t.integer :tv_program_id

      t.timestamps
    end
  end
end
