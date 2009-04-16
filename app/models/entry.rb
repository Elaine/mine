class Entry < ActiveRecord::Base
  include ActivityLogger
  after_save :log_activity

  acts_as_taggable_on :tags
  has_many :comments, :as => :item
  belongs_to :user, :counter_cache => true

  def log_activity
    add_activities(:item => self, :user => self.user)
  end
end
