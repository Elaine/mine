class Vote < ActiveRecord::Base
  belongs_to :business, :counter_cache => true
  belongs_to :user, :counter_cache => true
end
