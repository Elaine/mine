class ModifyUser < ActiveRecord::Migration
  def self.up
    rename_column :albums, :space_id, :user_id
    rename_column :entries, :space_id, :user_id
    rename_column :photos, :space_id, :user_id
    remove_column :spaces, :albums_count
    remove_column :spaces, :photos_count
    remove_column :spaces, :entries_count
    remove_column :spaces, :comments_count
    remove_column :spaces, :views_count
  end

  def self.down
  end
end
