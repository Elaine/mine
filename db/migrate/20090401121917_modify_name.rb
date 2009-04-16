class ModifyName < ActiveRecord::Migration
  def self.up
    rename_column :users, :username, :login_name
    rename_column :companies, :company_name, :login_name
  end

  def self.down
  end
end
