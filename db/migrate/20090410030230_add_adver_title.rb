class AddAdverTitle < ActiveRecord::Migration
  def self.up
    add_column :advertises, :title, :string
  end

  def self.down
  end
end
