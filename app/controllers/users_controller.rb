class UsersController < ApplicationController
  before_filter :login_required, :only => [:edit, :update]
  after_filter :recent_visit
  layout 'space'
  def edit
    @user = User.find(params[:id])
  end

  def edit_userinfo
    @user = User.find(params[:id])
    @userinfo = UserInfo.find_by_user_id(@user)
  end

  def update
    #在model里没有作密码一致性的验证,需要在view里作JS验证
    if logged_in_user.hashed_password == User.encrypt_password(params[:user][:oldpassword], logged_in_user.salt)
      logged_in_user.update_attributes(params[:user])
      case params[:modify]
      when 'pwd'
        flash[:password] = "密码更改完毕"
      when 'email'
        flash[:email] = "邮箱更改完毕"
      end
    else
      case params[:modify]
      when 'pwd'
        flash[:password] = "输入的历史密码有误"
      when 'email'
        flash[:email] = "输入的历史密码有误"
      end
    end
    redirect_to edit_user_path(:id => logged_in_user)
  end

  def show
    @user = User.find(params[:id])
    @entries = @user.entries.find(:all, :order => 'created_at DESC', :limit => 8)
    @albums = @user.albums.find(:all, :order => 'created_at DESC', :limit => 8)
    @friends = @user.friendships.find(:all, :conditions => {:passed => true})
    @visits = Visit.find_by_sql ["SELECT guest_id, count(DISTINCT guest_id) from visits where url like '%users/?%' GROUP BY guest_id ", @user]
    @comments = @user.comments
    @user.update_attributes(:views_count => @user.views_count + 1)
  end

  def panel
    @user = User.find(params[:id])
    @recent_users = User.find(:all, :order => 'created_at DESC', :limit => 20)
    @myfriends = @user.friendships.find(:all, :conditions => {:passed => true})
    @friends = Friendship.find_by_sql ["SELECT friend_id as id from friendships where user_id = ? AND passed = ?", @user, true]
    @activities = Activity.find_by_sql ["SELECT * from activities where user_id in (?)", @friends]
    @visits = Visit.find_by_sql ["SELECT guest_id, count(DISTINCT guest_id) from visits where url like '%space/?%' GROUP BY guest_id ", @space]
  end

 def myasks
    @user = User.find(params[:id])
    @asks = Ask.find(:all, :conditions => ["user_id = ?",@user]).paginate :page => params[:page], :per_page => 8
    @answers = Answer.find(:all, :conditions => ["user_id = ?", @user ]).paginate :page => params[:page], :per_page => 8
  end

end
