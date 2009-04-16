class CreateCompanyCategories < ActiveRecord::Migration
  def self.up
    create_table :company_categories do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :company_categories
  end
end
