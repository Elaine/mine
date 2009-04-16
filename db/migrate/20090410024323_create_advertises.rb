class CreateAdvertises < ActiveRecord::Migration
  def self.up
    create_table :advertises do |t|
      t.integer :company_id
      t.text :description
      t.string :address
      t.string :phone
      t.string :contact
      t.timestamps
    end
  end

  def self.down
    drop_table :advertises
  end
end
