class CreateCommentContents < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_contents do |t|
      t.integer :comment_id_on_provider
      t.string :url
      t.string :expanded_url

      t.timestamps
    end
  end
end
