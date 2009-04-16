require 'RMagick'
class Photo < ActiveRecord::Base
 #include ActivityLogger
 # after_save :log_activity
  acts_as_taggable_on :tags
  has_many :comments, :as => :item
  belongs_to :album, :counter_cache => true
  belongs_to :user, :counter_cache => true
  has_attachment :storage => :file_system,
    :max_size => 5.megabytes,
    :content_type => :image,
    :thumbnails => { :tiny => '60x60>', :thumb => '120x120>' },
    :processor => :Rmagick
  validates_as_attachment

  def log_activity
    add_activities(:item => self, :user => self.user)
  end
end
