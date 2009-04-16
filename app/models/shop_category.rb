class ShopCategory < ActiveRecord::Base
  has_many :subcategories, :class_name => 'ShopCategory', :foreign_key => 'parent_id'
  has_many :shops
  has_many :products
end
