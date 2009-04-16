class Forum < ActiveRecord::Base
  belongs_to :forum_category
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_one :last_post, :class_name => 'Post', :order => 'created_at desc'

  #最热门的话题
  def hottopic
    @topic = Topic.find(:first, :order => 'views_count DESC', :conditions => ["forum_id = ?", self.id] )
  end
end
