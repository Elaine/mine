class AddCompanyCategoryId < ActiveRecord::Migration
  def self.up
    add_column :companies, :company_category_id, :integer
  end

  def self.down
  end
end
