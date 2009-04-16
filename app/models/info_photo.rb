require 'RMagick'
class InfoPhoto < ActiveRecord::Base
  belongs_to :info
  has_attachment :storage => :file_system,
    :max_size => 5.megabytes,
    :content_type => :image,
    :thumbnails => { :tiny => '100x100>', :thumb => '160x160>' },
    :processor => :Rmagick
  validates_as_attachment
end
