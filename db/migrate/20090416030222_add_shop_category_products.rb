class AddShopCategoryProducts < ActiveRecord::Migration
  def self.up
    add_column :shop_categories, :products_count, :integer, :default => 0
    add_column :products, :shop_category_id, :integer
  end

  def self.down
  end
end
