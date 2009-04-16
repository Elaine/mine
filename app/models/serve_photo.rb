require 'RMagick'
class ServePhoto < ActiveRecord::Base
  belongs_to :business, :counter_cache => true
  has_attachment :storage => :file_system,
    :max_size => 5.megabytes,
    :content_type => :image,
    :thumbnails => { :tiny => '60x60>', :thumb => '120x120>' },
    :processor => :Rmagick
  validates_as_attachment
end
