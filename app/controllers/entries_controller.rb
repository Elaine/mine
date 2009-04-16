class EntriesController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  layout 'space'

  def new
    @user = User.find(params[:user_id])
    @entry = Entry.new
  end

  def create
    @user = User.find(params[:user_id])
    @entry = Entry.new(params[:entry])
    @entry.user = @user
    if @entry.save
      @user.tag(@entry, :with => params[:tags][:name], :on => :tags)
      @user.update_attribute(:score, @user.score + 1)
      if @user.score > @user.grade.score
        @user.update_attribute(:grade_id, @user.grade_id + 1)
      end
      flash[:notice] = "日志创建成功 "
      redirect_to user_entry_path(:id =>@entry)
    else
      render :action => 'new'
    end
  end

  def index
    @user = User.find(params[:user_id])
    @entries = @user.entries.find(:all, :order => 'created_at desc').paginate  :page => params[:page],:per_page => 10
    #@tags = @space.user.owned_taggings.find_all_by_taggable_type("Entry")
    @tags = @user.owned_tags
    @levels = (1 .. 5).map { |i| "level-#{i}" }
  end

  def show
    @user = User.find(params[:user_id])
    @entry = Entry.find(params[:id])
    @entry.update_attributes(:views_count => @entry.views_count + 1)
  end

  def edit
    @user = User.find(params[:user_id])
    @entry = @user.entries.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to user_entry_path(:id => @entry)
    end
  end

  def add_recommend
    @entry = Entry.find(params[:id])
    @entry.update_attributes(:recommend_counts => @entry.recommend_counts + 1)
    redirect_to user_entry_path(:id => @entry)
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to user_entries_path(:user_id => @entry.user)
  end
end
