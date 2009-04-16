class Business < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  belongs_to :serve_category
  belongs_to :user
  has_many :serve_photos, :dependent => :destroy

  def last_vote
    @vote = Vote.find(:last, :conditions => {:business_id => self.id} )
  end

end
