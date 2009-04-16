class ModifyGrade < ActiveRecord::Migration
  def self.up
    add_column :grades, :level, :string
  end

  def self.down
  end
end
