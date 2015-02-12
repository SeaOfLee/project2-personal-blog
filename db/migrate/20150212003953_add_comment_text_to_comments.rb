class AddCommentTextToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_text, :text
  end
end
