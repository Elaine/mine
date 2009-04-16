class CommunityController < ApplicationController
  def index
    @categories = BoardCategory.find(:all, :conditions => {:category_type => 1})
    #优秀博客文章
    @goodentries = Entry.find(:all, :order => 'views_count desc', :limit => 18)
    #精彩用户
    @goodusers = User.find(:all, :order => 'views_count desc', :limit => 5)
    #最新博客文章(五)
    @newentries = Entry.find(:all, :order => 'created_at desc', :limit => 5)
    #最新加入会员
    @newusers = User.find(:all, :order => 'created_at desc', :limit => 8)
  end

  #博客

  def entrylist
    @categories = BoardCategory.find(:all, :conditions => {:category_type => 1})
    #最新文章
    @newentries = Entry.find(:all, :order => 'created_at desc', :limit => 30).paginate :page => params[:page], :per_page => 10
    #热评文章
    @hotentries = Entry.find(:all, :order => 'comments_count desc', :limit => 30).paginate :page => params[:page], :per_page => 10
    #最新博客评论
    @newcomments = Comment.find(:all, :order => 'created_at desc', :limit => 5, :conditions => ["item_type = ?", "Entry"])
    #推荐文章

  end
  #拍拍

  def photolist
    @categories = BoardCategory.find(:all, :conditions => {:category_type => 1})
  end

  #会员排行榜
  def memberlist
    @categories = BoardCategory.find(:all, :conditions => {:category_type => 1})
    @gradelist = User.find(:all, :order => 'score desc', :limit => 20)
    @postlist = User.find(:all, :order => 'posts_count desc', :limit => 20)
    @votelist = User.find(:all, :order => 'votes_count desc', :limit => 20)
    @answerlist = User.find(:all, :order => 'answers_count desc', :limit => 20)
  end

  #找朋友
  def friendlist
    @categories = BoardCategory.find(:all, :conditions => {:category_type => 1})
    @newuser = User.find(:all, :order => 'created_at desc', :limit => 40)
    @hotuser = User.find(:all, :order => 'views_count desc', :limit => 24)
    if request.post?
      if params[:userinfo][:type] == "School"
        @users = UserInfo.find(:all, :order => 'created_at desc', :conditions => ["school = ?", params[:userinfo][:school]]).paginate :page => params[:page], :per_page => 8
      elsif params[:userinfo][:type] == "Hobiy"
        @users = logged_in_user.find_related_interests
      elsif params[:userinfo][:type] == "Friend"
        #@users = UserInfo.find(:all, :order => 'created_at desc', :conditions => ["sex = ? AND educational = ? AND job = ? ",params[:sex], params[:educational], params[:job]]).paginate :page => params[:page], :per_page => 8
        @sql_str = "select * from user_infos info, users u where info.user_id = u.id"
        if params[:sex] != "" 
          @sql_str = @sql_str +  " and info.sex = '#{params[:sex]}'"
        end
        if params[:job] != ""
          @sql_str = @sql_str +  " and info.job = '#{params[:job]}'"
        end
        if params[:educational] != ""
          @sql_str = @sql_str +  " and info.educational= '#{params[:educational]}'"
        end
        if params[:keyword] != ""
          if params[:keytype] == "login_name"
            @sql_str = @sql_str + " and u.login_name like '%#{params[:keyword]}%'"
          elsif params[:keytype] == "email"
            @sql_str = @sql_str + " and u.email like '%#{params[:keyword]}%'"
          elsif params[:keytype] == "id"
            @sql_str = @sql_str + " and u.id like '%#{params[:keyword]}%'"
          end
        end
        if params[:age].to_i > 0
          if params[:age].to_i == 20
            @sql_str = @sql_str +  " and date_part('year', info.birthday) > #{Time.now.year - 20} "
          elsif params[:age].to_i == 28
            @sql_str = @sql_str +  " and date_part('year', info.birthday) between '#{Time.now.year - 28}' and '#{Time.now.year - 20}' "
          elsif params[:age].to_i == 35
            @sql_str = @sql_str +  " and date_part('year', info.birthday) between '#{Time.now.year - 35}'and '#{Time.now.year - 28}' "
          elsif params[:age].to_i == 45
            @sql_str = @sql_str +  " and date_part('year', info.birthday) between '#{Time.now.year - 45}' and '#{Time.now.year - 35}' "
          elsif params[:age].to_i == 46
            @sql_str = @sql_str +  " and date_part('year', info.birthday) < #{Time.now.year - 45} "
          end
        end
        #flash[:notice] = "#{Time.now.strftime('%Y').to_i - 24}"
        @users = UserInfo.find_by_sql [@sql_str].paginate :page => params[:page], :per_page => 8
      end
    end
  end
end
