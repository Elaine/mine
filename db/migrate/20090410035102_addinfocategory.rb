class Addinfocategory < ActiveRecord::Migration
  def self.up
    add_column :info_categories, :info_type, :string
  end

  def self.down
  end
end
