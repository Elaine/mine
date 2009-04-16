class AskCategory < ActiveRecord::Base
  has_many :asks, :dependent => :destroy
  #named_scope :hots, :order => 'created_at desc', :limit => 16

  def hot
    @asks = Ask.find_all_by_ask_category_id(self.id, :order => 'views_count desc', :limit => 16)
  end

end
