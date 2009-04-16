class CommentsController < ApplicationController
  before_filter :login_required, :except => [:index]
  layout 'space'
  def new
  end

  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.paginate :page => params[:page], :per_page => 10
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.poster_id = logged_in_user.id
    @comment.poster_type = logged_in_type
    if @comment.save
      if logged_in_type == "User"
       @comment.poster.update_attribute(:score, @comment.poster.score + 1)
     end
      flash[:notice] = "#{logged_in_user.id}"
      redirect_to  params[:switch]+"#"+@comment.id.to_s
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to params[:backurl]
  end
end
