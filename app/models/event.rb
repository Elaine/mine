class Event < ActiveRecord::Base
  has_many :eventors
  has_many :comments, :as => :item
  has_many :users, :through => :eventors
  belongs_to :event_category
acts_as_taggable_on :tags
end
