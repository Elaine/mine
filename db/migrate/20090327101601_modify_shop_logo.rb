class ModifyShopLogo < ActiveRecord::Migration
  def self.up
    add_column :shops, :brand, :integer
  end

  def self.down
  end
end
