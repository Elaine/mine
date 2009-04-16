class CreateShopPhotos < ActiveRecord::Migration
  def self.up
    create_table :shop_photos do |t|
      t.integer :shop_id
      t.integer :product_id
      t.integer :parent_id

      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height

      t.boolean :primary
      t.boolean :avatar
      t.timestamps
    end
  end

  def self.down
    drop_table :shop_photos
  end
end
