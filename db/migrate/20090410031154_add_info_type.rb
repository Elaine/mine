class AddInfoType < ActiveRecord::Migration
  def self.up
    add_column :infos, :address, :string
    add_column :infos, :info_type, :string
  end

  def self.down
  end
end
