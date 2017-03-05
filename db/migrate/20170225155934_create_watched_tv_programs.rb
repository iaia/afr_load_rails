class CreateWatchedTvPrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :watched_tv_programs do |t|
      t.integer :user_id
      t.integer :tv_program_id
      t.boolean :watched, default: false, null: false
      t.boolean :real_time_watched, default: false, null: false
      t.datetime :watched_date

      t.timestamps
    end
  end
end
