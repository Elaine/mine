class Topic < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  belongs_to :forum, :counter_cache => true
  has_many :posts, :dependent => :destroy

  acts_as_taggable_on :tags
  #最后回复
  def lastpost
    @post = Post.find(:last, :conditions => { :topic_id => self.id })
  end

  #精华贴
  def best_paste
    @best = Topic.find(:all, :conditions => ["status = ?", "精华贴"])
  end
  #良好贴
  
end
