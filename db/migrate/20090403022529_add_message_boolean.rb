class AddMessageBoolean < ActiveRecord::Migration
  def self.up
    add_column :messages, :manager, :boolean, :default => false
  end

  def self.down
  end
end
