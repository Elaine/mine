class AddUserEnabled < ActiveRecord::Migration
  def self.up
    add_column :users, :enabled, :boolean, :default => true
  end

  def self.down
  end
end
