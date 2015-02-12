class RemoveCommentTextFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment_text, :string
  end
end
