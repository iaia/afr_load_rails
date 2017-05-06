class AddColumnCommentIdOnProviderToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :comment_id_on_provider, :string
  end
end
