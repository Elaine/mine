class AdduserVotesCount < ActiveRecord::Migration
  def self.up
    add_column :users, :votes_count, :integer, :default => 0
  end

  def self.down
  end
end
