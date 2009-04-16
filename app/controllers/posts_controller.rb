class PostsController < ApplicationController
  before_filter :login_required
  def new
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @forum = Forum.find(params[:forum_id])
    @post = logged_in_user.posts.new(params[:post])
    @post.topic = @topic
    @post.forum = @forum
    @post.save
    if @topic.posts_count > 10
      @topic.update_attribute(:status, "良好贴")
    elsif @topic.posts_count > 30
      @topic.update_attribute(:status, "精华贴")
    end
    @post.user.update_attribute(:score,@post.user.score + 1 )
    if @post.user.score > @post.user.grade.score
      @post.user.update_attribute(:grade_id, @post.user.grade_id + 1)
    end
    redirect_to forum_topic_path(:forum_id => @forum.id, :id =>@topic.id)
  end
end
