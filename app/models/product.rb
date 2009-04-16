class Product < ActiveRecord::Base
  belongs_to :item, :polymorphic => true, :counter_cache => true
  has_many :reservations
  belongs_to :shop_category, :counter_cache => true
  has_many :item_photos, :dependent => :destroy
  has_one :avatar, :class_name => 'ItemPhoto', :conditions =>["item_photos.avatar = ?", true]
  has_many :comments, :as => :item

  acts_as_taggable_on :tags
  validates_presence_of :name, :introduction
  validates_uniqueness_of :name
end
