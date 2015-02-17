class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.date :photo_date
      t.references :post, index: true

      t.timestamps
    end
  end
end
