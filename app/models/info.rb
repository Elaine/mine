class Info < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :info_category
  has_many :info_photos, :dependent => :destroy
  has_many :comments, :as => :item
  acts_as_taggable_on :tags
end
