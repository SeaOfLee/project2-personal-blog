class AddPostTextToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_text, :text
  end
end
