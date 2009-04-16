class AddInfoContact < ActiveRecord::Migration
  def self.up
    add_column :infos, :contact, :string
  end

  def self.down
  end
end
