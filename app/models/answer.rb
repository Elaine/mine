class Answer < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :ask, :counter_cache => true
end
