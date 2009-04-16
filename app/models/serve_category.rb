class ServeCategory < ActiveRecord::Base
  has_many :votes
  has_many :businesses, :dependent => :destroy
  has_many :children_category, :class_name => 'ServeCategory', :foreign_key => 'parent_id'
end
