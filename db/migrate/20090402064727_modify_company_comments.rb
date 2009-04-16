class ModifyCompanyComments < ActiveRecord::Migration
  def self.up
    remove_column :companies, :company_comments_count
    add_column :companies, :comments_count, :integer, :default => 0
  end

  def self.down
  end
end
