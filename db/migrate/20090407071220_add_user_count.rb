class AddUserCount < ActiveRecord::Migration
  def self.up
    add_column :users, :entries_count, :integer, :default => 0
    add_column :users, :albums_count, :integer, :default => 0
    add_column :users, :comments_count, :integer, :default => 0
    add_column :users, :views_count, :integer, :default => 0
  end

  def self.down
  end
end
