class ModifyProducts < ActiveRecord::Migration
  def self.up
    rename_column :products, :shop_id, :item_id
    add_column :products, :item_type, :string
    add_column :companies, :products_count, :integer, :default => 0
  end

  def self.down
  end
end
