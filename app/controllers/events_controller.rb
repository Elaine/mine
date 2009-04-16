class EventsController < ApplicationController
  before_filter :login_required, :except => [:index, :category_events, :show]
  def category_events
    @categoryevents = Event.find_all_by_event_category_id(params[:category_id], :order => 'created_at desc').paginate :page => params[:page], :per_page => 10
    @eventcategories = EventCategory.find(:all, :order => 'created_at desc')
  end

  def index
    @eventcategories = EventCategory.find(:all)
    @recent_events = Event.find(:all, :order => 'created_at DESC', :conditions => ["closed = ? AND offical = ?", false, false],:limit => 3).paginate :page => params[:page], :per_page => 10
    @official_events = Event.find(:all, :order => 'created_at desc', :conditions => {:offical => true}, :limit => 3).paginate :page => params[:page], :per_page => 10
    @user_events = Event.find_all_by_user_id(logged_in_user, :order => 'created_at desc')
    if is_logged_in?
    @user = User.find(logged_in_user)
    end
  end

  def new
    @user = User.find(logged_in_user)
    @event = Event.new
  end

  def create
    @event = logged_in_user.events.new(params[:event])
    @user = logged_in_user
    if @event.save
      @user.tag(@event, :with => params[:tags][:name], :on => :tags)
      redirect_to events_path
    else
      render :action => 'new'
    end
  end

  def show
    @eventcategories = EventCategory.find(:all)
    @event = Event.find(params[:id])
    @event.update_attributes(:views_count => @event.views_count + 1)
  end

  def edit
    @eventcategories = EventCategory.find(:all)
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @events_users = Eventor.find_all_by_event_id_and_user_id(@event,logged_in_user)
    if @events_users.empty?
      @event_user = Eventor.new(params[:eventor])
      @event_user.user_id = logged_in_user.id
      @event_user.event_id = @event.id
      @event_user.save
      @event.update_attributes(:members => @event.members + @event_user.members)
    else
      flash[:notice] = "您已经报名了!"
    end
    redirect_to :action => 'show', :id => @event
  end
end
