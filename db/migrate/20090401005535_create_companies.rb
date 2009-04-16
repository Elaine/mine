class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :company_name
      t.string :hashed_password
      t.string :salt
      t.string :company_email
      t.string :master_name
      t.text :description
      t.integer :views_count
      t.string :address
      t.string :phone
      t.string :fax
      t.string :website
      t.string :postal
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
