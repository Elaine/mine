class AddViewsCountDefault < ActiveRecord::Migration
  def self.up
    add_column :companies, :comments_count, :integer, :default => 0
    remove_column :companies, :views_count
    add_column :companies, :views_count, :integer, :default => 0
  end

  def self.down
  end
end
