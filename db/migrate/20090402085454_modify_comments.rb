class ModifyComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :space_id
    add_column :comments, :poster_id, :integer
    add_column :comments, :poster_type, :string
  end

  def self.down
  end
end
