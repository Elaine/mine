class AddBusinessVotes < ActiveRecord::Migration
  def self.up
    add_column :businesses, :votes_count, :integer, :default => 0
  end

  def self.down
  end
end
