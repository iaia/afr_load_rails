class CreateMovieThumbnails < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_thumbnails do |t|
      t.integer :movie_id
      t.string :path
      t.integer :file_size
      t.string :caption
      t.boolean :view_status
      t.boolean :status
      t.boolean :removed

      t.timestamps
    end
  end
end
