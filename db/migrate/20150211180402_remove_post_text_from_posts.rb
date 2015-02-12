class RemovePostTextFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :post_text, :string
  end
end
