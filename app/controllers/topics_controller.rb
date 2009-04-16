class TopicsController < ApplicationController
  layout 'forums'
  before_filter :login_required, :except => [:show]
  def new
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = logged_in_user.topics.new(params[:topic])
    @topic.forum = @forum
    if @topic.save
      @topic.user.tag(@topic, :with => params[:tags][:name], :on => :tags)
      @topic.user.update_attribute(:score,logged_in_user.score + 2)
      if @topic.user.score > @topic.user.grade.score
        @topic.user.update_attribute(:grade_id, @topic.user.grade_id + 1)
      end
      redirect_to forum_topic_path(:forum_id => @forum.id, :id => @topic.id)
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.find(:all).paginate :page => params[:page], :per_page => 8
    unless logged_in_user == @topic.user
      @topic.update_attributes(:views_count => @topic.views_count + 1)
    end
  end
end
