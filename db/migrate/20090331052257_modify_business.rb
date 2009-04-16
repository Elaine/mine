class ModifyBusiness < ActiveRecord::Migration
  def self.up
    remove_column :businesses, :working
    remove_column :businesses, :park
    remove_column :businesses, :box
    remove_column :businesses, :takeaway
    remove_column :businesses, :creditcard
    add_column :businesses, :working, :string, :default => "不详"
    add_column :businesses, :park, :string, :default => "不详"
    add_column :businesses, :box, :string, :default => "不详"
    add_column :businesses, :takeaway, :string, :default => "不详"
    add_column :businesses, :creditcard, :string, :default => "不详"
  end

  def self.down
  end
end
