class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :product_id
      t.integer :counts, :default => 0
      t.string :truename
      t.integer :sex, :default => 1
      t.string :phone
      t.string :receive_address
      t.string :add
      t.boolean :status, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
