class CreateInfoCategories < ActiveRecord::Migration
  def self.up
    create_table :info_categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :infos_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :info_categories
  end
end
