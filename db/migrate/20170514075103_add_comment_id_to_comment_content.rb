class AddCommentIdToCommentContent < ActiveRecord::Migration[5.0]
  def change
    add_column :comment_contents, :comment_id, :integer, after: :id, null: false, default: 0
    remove_column :comment_contents, :comment_id_on_provider, :string
  end
end
