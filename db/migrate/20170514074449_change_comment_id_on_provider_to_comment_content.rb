class ChangeCommentIdOnProviderToCommentContent < ActiveRecord::Migration[5.0]
  def change
    change_column :comment_contents, :comment_id_on_provider, :string
  end
end
