class Ask < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  has_many :answers, :dependent => :destroy
  belongs_to :ask_category
  named_scope :hot, :order => 'views_count desc'
  acts_as_taggable_on :tags

  def solvedanswer
    @answer = Answer.find_by_ask_id(self.id, :conditions => {:status => true})
  end
end
