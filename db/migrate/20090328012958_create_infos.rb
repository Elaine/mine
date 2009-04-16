class CreateInfos < ActiveRecord::Migration
  def self.up
    create_table :infos do |t|
      t.integer :info_category_id
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :comments_count, :default => 0
      t.string :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :infos
  end
end
