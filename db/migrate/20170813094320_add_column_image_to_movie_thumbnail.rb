class AddColumnImageToMovieThumbnail < ActiveRecord::Migration[5.0]
  def change
    add_column :movie_thumbnails, :image, :string
  end
end
