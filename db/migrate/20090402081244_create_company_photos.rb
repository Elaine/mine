class CreateCompanyPhotos < ActiveRecord::Migration
  def self.up
    create_table :company_photos do |t|
      t.integer :company_id
      t.integer :parent_id

      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height

      t.boolean :avatar
      t.timestamps
    end
    remove_column :shop_photos, :primary
    remove_column :shops, :brand
  end

  def self.down
    drop_table :company_photos
  end
end
