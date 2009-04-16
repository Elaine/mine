class HomeController < ApplicationController
  def index
    #产品分类
    @parent_categories = ShopCategory.find(:all, :conditions => {:parent_id => nil})
    #信息汇
    @infocategories = InfoCategory.find(:all, :order => 'name desc').paginate :page => params[:page], :per_page => 10
    @house = InfoCategory.find_by_name('房源')
    @houseinfos = @house.infos.find(:all, :order => 'views_count desc', :limit => 10)
    @work = InfoCategory.find_by_name('工作')
    @workinfos = @work.infos.find(:all, :order => 'views_count desc', :limit => 10)
    @second = InfoCategory.find_by_name('二手')
    @secondinfos = @second.infos.find(:all, :order => 'views_count desc', :limit => 10)
    @serve = InfoCategory.find_by_name('供求')
    @serveinfos = @serve.infos.find(:all, :order => 'views_count desc', :limit => 10)
    @marry = InfoCategory.find_by_name('婚嫁')
    @marryinfos = @marry.infos.find(:all, :order => 'views_count desc', :limit => 10)

    #热门活动
    @hotevents = Event.find(:all, :order => 'views_count DESC', :conditions => ["closed = ?", false], :limit => 4)
    #活动回顾
    @eventforum = Forum.find_by_title("会员活动")
    @eventtopics = Topic.find_all_by_forum_id(@eventforum, :order => 'views_count desc', :limit => 7)
    #热门话题
    @hottopics = Topic.find(:all, :order => 'views_count desc', :limit => 10)
    #明星会员
    @hotusers = User.find(:all, :order => 'views_count desc', :limit => 5)
    #消费点评热门推荐
    @votes = ServeCategory.find(:all, :order => 'name desc', :conditions => {:parent_id => nil})
    #摄影婚庆
    @marryforum = Forum.find_by_title("摄影婚庆")
    @marrytopics = Topic.find_all_by_forum_id(@marryforum, :order => 'views_count desc', :limit => 2)
    #家居
    @houseforum = Forum.find_by_title("家居")
    @housetopics = Topic.find_all_by_forum_id(@houseforum, :order => 'views_count desc', :limit => 2)
    #汽车服务
    @carforum = Forum.find_by_title("汽车服务")
    @cartopics = Topic.find_all_by_forum_id(@carforum, :order => 'views_count desc', :limit => 2)
    #培训
    @peixun = Forum.find_by_title("培训教育")
    @pxtopics = Topic.find_all_by_forum_id(@peixun, :order => 'views_count desc', :limit => 2)
    #生活帮
    @askeds = Ask.find(:all, :order => 'created_at desc', :conditions => {:solved => true}, :limit => 10)
    @askings = Ask.find(:all, :order => 'created_at desc', :conditions => ["solved = ? and closed = ?", false, false], :limit => 10)
  end
end
