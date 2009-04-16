class AddUserLastLogin < ActiveRecord::Migration
  def self.up
    add_column :users, :last_activity, :datetime
  end

  def self.down
  end
end
