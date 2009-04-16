class AsksController < ApplicationController
  before_filter :login_required, :only => [:edit, :update, :close_ask]
  layout 'asks'
  def category_asks
    @asks = Ask.find_all_by_ask_category_id(params[:category_id], :order => 'created_at desc')
  end

  def home
    @askcategories = AskCategory.find(:all, :order => 'name desc')
    @life = AskCategory.find_by_name('生活')
    @work = AskCategory.find_by_name('工作')
    @edu = AskCategory.find_by_name('教育')
    @feel = AskCategory.find_by_name('情感')
    @gossip = AskCategory.find_by_name('八卦')

  end

  def index
    @asks = Ask.find(:all, :order => 'created_at desc')
    @hotasks = Ask.find(:all, :order => 'views_count desc', :limit => 6)
  # @askings = Ask.find(:all, :order => 'created_at desc', :conditions => {:solved => false}).paginate :page => params[:page], :per_page => 2
    @askeds = Ask.find(:all, :order => 'created_at desc', :conditions => {:solved => true}).paginate :page => params[:page], :per_page => 2
    @closeasks = Ask.find(:all, :order => 'created_at desc', :conditions => {:closed => true }).paginate :page => params[:page], :per_page => 2
    @askings = Ask.paginate(:all, :order => 'created_at desc', :conditions => {:solved => false}, :page => params[:page], :per_page => 2)
#  @photos = Photo.paginate(:all, :conditions => ["photos.user_id = ?", current_user.id], :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.js do
        render :update do |page|
          page.replace_html 'photos', :partial => "photos"
        end
      end
    end

  end

  def new
    @user = User.find(logged_in_user)
    @ask = Ask.new
  end

  def create
    @ask = Ask.new(params[:ask])
    @ask.user = logged_in_user
    @ask.end_at = Time.now + 5.days
   if @ask.save
     @ask.user.tag(@ask, :with => params[:tags][:name], :on => :tags)
    redirect_to asks_path
   end
  end

  def show
    @ask = Ask.find(params[:id])
    @ask.update_attributes(:views_count => @ask.views_count + 1)
  end

  def edit
    @ask = Ask.find(params[:id])
  end

  def update
    @ask = Ask.find(params[:id])
    @ask.update_attributes(params[:ask])
    redirect_to asks_path
  end

  def close_ask
    @ask = Ask.find(params[:id])
    @ask.update_attributes(:closed => true)
    redirect_to asks_path
  end
end
