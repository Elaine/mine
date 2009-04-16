class InfosController < ApplicationController
  before_filter :login_required, :only => [:new, :create, :destroy]

  def category_infos
    @infos = Info.find_all_by_info_category_id(params[:category_id]).paginate :page => params[:page], :per_page => 10
  end

  def index
    #@infocategories = InfoCategory.find(:all, :order => 'name desc').paginate :page => params[:page], :per_page => 10
    #五个滑动模块
    @house = InfoCategory.find_by_name('房源')
    @houseinfos = @house.infos.find(:all, :order => 'views_count desc', :limit => 11)
    @work = InfoCategory.find_by_name('工作')
    @workinfos = @work.infos.find(:all, :order => 'views_count desc', :limit => 11)
    @second = InfoCategory.find_by_name('二手')
    @secondinfos = @second.infos.find(:all, :order => 'views_count desc', :limit => 11)
    @serve = InfoCategory.find_by_name('供求')
    @serveinfos = @serve.infos.find(:all, :order => 'views_count desc', :limit => 11)
    @marry = InfoCategory.find_by_name('婚嫁')
    @marryinfos = @marry.infos.find(:all, :order => 'views_count desc', :limit => 11)
    #生活信息
    @life = InfoCategory.find_by_name('生活')
    @lifeinfos = @life.infos.find(:all, :order => 'views_count desc', :limit => 11)
    #交友信息
    @friend = InfoCategory.find_by_name('交友')
    @friendinfos = @friend.infos.find(:all, :order => 'views_count desc', :limit => 11)
  end

  def new
    @info = Info.new
  end

  def create
    @info = logged_in_user.infos.new(params[:info])
    if @info.save
      if params[:item_type] == "User"
      @info.user.tag(@info, :with => params[:tags][:name], :on => :tags)
      end
      redirect_to params[:switch]
    end
  end

  def show
    @info = Info.find(params[:id])
    @info.update_attributes(:views_count => @info.views_count + 1)
  end

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])
    if @info.update_attributes(params[:info])
      redirect_to params[:switch]
    end
  end
end
