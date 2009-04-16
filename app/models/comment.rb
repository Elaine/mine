class Comment < ActiveRecord::Base
  belongs_to :poster, :polymorphic => true#, :counter_cache => true
  belongs_to :item, :polymorphic => true, :counter_cache => true
end
