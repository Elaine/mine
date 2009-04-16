class AddEntryRecommend < ActiveRecord::Migration
  def self.up
    add_column :entries, :recommend_counts, :integer, :default => 0
  end

  def self.down
  end
end
