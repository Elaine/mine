class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.integer :user_id
      t.string :city
      t.string :name
      t.string :address
      t.string :phone
      t.integer :serve_category_id
      t.text :description
      t.string :working
      t.string :park
      t.boolean :box
      t.boolean :takeaway
      t.boolean :creditcard
      t.string :bus
      t.integer :price
      t.boolean :master, :default => true
      t.integer :want, :default => 0
      t.integer :gone, :default => 0
      t.integer :serve_photos_count, :default => 0
      t.integer :views_count
      t.timestamps
    end
    rename_column :votes, :shop_id, :business_id
    remove_column :votes, :want
    remove_column :votes, :gone
    remove_column :serve_photos_count
    remove_column :votes, :counts
  end

  def self.down
    drop_table :businesses
  end
end
