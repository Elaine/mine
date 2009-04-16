class FriendsController < ApplicationController
  before_filter :login_required, :only => [:new, :destroy, :update]
  layout 'space'
  def index
    @user = User.find(params[:user_id])
    @space = @user.space
    @friends = @user.friendships.find(:all, :conditions => {:passed => true}).paginate :page => params[:page], :per_page => 10
 #   @friends = @user.friendships.paginate :page => params[:page], :per_page => 10
  end

  #我的申请
  def myrequest
    @space = logged_in_user.space
    @friends = Friendship.find_all_by_user_id(logged_in_user, :conditions => {:passed => false}).paginate :page => params[:page], :per_page => 10
  end

  #申请我的
  def needpassed
    @space = logged_in_user.space
    @friends = Friendship.find_all_by_friend_id(logged_in_user, :conditions => {:passed => false}).paginate :page => params[:page], :per_page => 10
  end

  def new
    #@user = User.find(params[:user_id])
    @user = logged_in_user
    @friend = User.find(params[:friend_id])
    flash[:error] = "不能添加自己!" unless @friend != @user
    if @friend.user_info.authenticate == 3
      flash[:notice] = "该用户不允许加为好友"
    else
      passed = false unless @friend.user_info.authenticate == 1
      @user.friendships.create(:friend_id => @friend.id, :passed => passed)
    end
    redirect_to space_path(:id => @friend.space)
  end

  def destroy
    @user =  logged_in_user
    #@friendship = @user.friendships.find_by_friend_id(params[:id]).destroy
    @friendship = @user.friendships.find_by_friend_id(params[:id]).destroy
    redirect_to user_friends_path(:user_id => @user)
  end

  def update
    #@friend = Friendship.find_by_user_id(params[:user_id])
    @friend = Friendship.find_by_user_id(params[:user_id])
    @friend.update_attributes(:passed => true)
    redirect_to user_friends_path(:user_id => @friend.user)
  end
end
