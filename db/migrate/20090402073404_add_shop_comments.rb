class AddShopComments < ActiveRecord::Migration
  def self.up
    add_column :shops, :comments_count, :integer, :default => 0
  end

  def self.down
  end
end
