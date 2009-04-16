class Admin::HomeController < ApplicationController 
  layout 'admin'
  before_filter :admin_login_required, :except => [:login]
  def index
    @admin = Admin.find(session[:admin])
    @messages = Message.find(:all, :conditions => ["manager = ? AND  recipient_id = ?", true, logged_in_admin.id]).paginate :page => params[:page], :per_page => 10
  end

  def login
    if request.post?
      reset_session
      if @admin = Admin.authenticate(params[:name], params[:password])
        self.logged_in_admin= @admin
        redirect_to adminhome_path
      else
        render :action => 'login'
      end
    end
  end

  def logout
    reset_session
    flash[:notice] = "您已经退出管理界面" 
    redirect_to :action => 'login'
  end

  def edit
    @admin = Admin.find(logged_in_admin)
    if @admin.hashed_password == Admin.encrypt_password(params[:oldpassword], @admin.salt)
      if params[:password] == params[:password_confirmation]
        @admin.update_attributes(params[:admin])
        flash[:notice] = "密码更改完毕"
        redirect_to :action => 'index'
      else
        flash[:error] = "两次密码不一致!"
        render :action => 'edit'
      end
    else
      flash[:error] = "当前密码输入错误"
      render :action => 'edit'
    end
  end

  def update
    @admin = Admin.find(logged_in_admin)
    if @admin.update_attributes(params[:admin])
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
end
