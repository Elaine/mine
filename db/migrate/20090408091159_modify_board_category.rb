class ModifyBoardCategory < ActiveRecord::Migration
  def self.up
    remove_column :board_categories, :type
    add_column :board_categories, :category_type, :integer, :default => 1
  end

  def self.down
  end
end
