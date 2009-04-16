class ModifyTopic < ActiveRecord::Migration
  def self.up
    add_column :topics, :status, :string
  end

  def self.down
  end
end
