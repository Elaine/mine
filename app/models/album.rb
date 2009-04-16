class Album < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  has_many :photos, :dependent => :destroy
  has_one :primary, :class_name => 'Photo', :conditions =>["photos.primary = ?", true]
  acts_as_taggable_on :tags
end
