class ModifyInfo < ActiveRecord::Migration
  def self.up
    rename_column :infos, :user_id, :item_id
    rename_column :infos, :info_type, :item_type
  end

  def self.down
  end
end
