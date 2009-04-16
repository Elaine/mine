class AddAskViewsCount < ActiveRecord::Migration
  def self.up
    add_column :asks, :views_count, :integer, :default => 0
  end

  def self.down
  end
end
