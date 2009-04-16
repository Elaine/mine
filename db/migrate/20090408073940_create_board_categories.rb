class CreateBoardCategories < ActiveRecord::Migration
  def self.up
    create_table :board_categories do |t|
      t.string :name
      t.integer :type
      t.timestamps
    end
  end

  def self.down
    drop_table :board_categories
  end
end
