class ModifyGradeId < ActiveRecord::Migration
  def self.up
    remove_column :users, :grade_id
    add_column :users, :grade_id, :integer, :default => 1
  end

  def self.down
  end
end
