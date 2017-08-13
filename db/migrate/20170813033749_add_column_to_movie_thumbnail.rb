class AddColumnToMovieThumbnail < ActiveRecord::Migration[5.0]
  def change
    add_column :movie_thumbnails, :width, :integer
    add_column :movie_thumbnails, :height, :integer
    add_column :movie_thumbnails, :type, :string
  end
end
