class AddProductCounts < ActiveRecord::Migration
  def self.up
    add_column :products, :comments_count, :integer, :default => 0
  end

  def self.down
  end
end
