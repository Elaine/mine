class CreateInfoPhotos < ActiveRecord::Migration
  def self.up
    create_table :info_photos do |t|
      t.integer :info_id
      t.integer :parent_id

      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height

      t.timestamps
    end
    add_column :infos, :views_count, :integer
  end

  def self.down
    drop_table :info_photos
  end
end
