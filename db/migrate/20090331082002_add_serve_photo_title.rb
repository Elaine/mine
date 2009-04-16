class AddServePhotoTitle < ActiveRecord::Migration
  def self.up
    add_column :serve_photos, :title, :string
  end

  def self.down
  end
end
