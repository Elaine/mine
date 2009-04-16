class Renameshopphotos < ActiveRecord::Migration
  def self.up
    rename_column :shop_photos, :shop_id, :item_id
    add_column :shop_photos, :item_type, :string
    rename_table :shop_photos, :item_photos
  end

  def self.down
  end
end
