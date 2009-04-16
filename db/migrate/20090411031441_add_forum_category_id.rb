class AddForumCategoryId < ActiveRecord::Migration
  def self.up
    add_column :forums, :forum_category_id, :integer
  end

  def self.down
  end
end
