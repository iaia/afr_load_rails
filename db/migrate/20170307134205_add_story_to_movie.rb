class AddStoryToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :story, :string, after: :released_country
  end
end
