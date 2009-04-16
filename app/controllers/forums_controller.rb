class ForumsController < ApplicationController

  def index
    @forums = Forum.paginate :page => params[:page], :per_page => 10
    @topics = Topic.find(:all, :order => 'created_at desc', :limit => 10)
    @posts = Post.find(:all, :order => 'created_at desc', :limit => 10)
    @hottopics = Topic.find(:all, :order => 'views_count desc', :limit => 10)
  end
  
  def show
    @forum = Forum.find(params[:id])
    @topics = @forum.topics.find(:all).paginate :page => params[:page], :per_page => 10
  end

end
