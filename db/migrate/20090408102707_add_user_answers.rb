class AddUserAnswers < ActiveRecord::Migration
  def self.up
    add_column :users, :answers_count, :integer, :default => 0
  end

  def self.down
  end
end
