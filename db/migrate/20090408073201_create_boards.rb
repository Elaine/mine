class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
      t.integer :board_category_id
      t.integer :type_id
      t.integer :user_id
      t.string :to
      t.string :content
      t.timestamps
    end
  end

  def self.down
    drop_table :boards
  end
end
