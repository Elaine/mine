class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :user_id
      t.integer :shop_id
      t.integer :quality, :default => 3
      t.integer :environment, :default => 3
      t.integer :services, :default => 3
      t.integer :members
      t.decimal :price
      t.datetime :time
      t.string :recommend
      t.text :feel
      t.integer :counts, :default => 0
      t.integer :serve_photos_count, :default => 0
      t.integer :want, :default => 0
      t.integer :gone, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
