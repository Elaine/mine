class AccountController < ApplicationController
  layout 'users'
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @space = Space.create(:user_id => @user.id, :address => "i.#{request.host}/#{@user.login_name}")
      @userinfo = UserInfo.create(:user_id => @user.id)
      self.logged_in_user= @user
      self.logged_in_type = params[:logged_in_type]
      flash[:notice] = "用户注册成功"
      redirect_to controlpanel_path(:id => @user)
    else
      render :action => 'new'
    end
  end

  def login
    if request.post?
      case params[:logged_in_type]
      when "User"
        reset_session
        if @user = User.authenticate(params[:login_name],params[:password])
          if @user.enabled == false
            flash[:error] = "对不起,您的用户已经被禁用了!!"
          else
            self.logged_in_user = @user
            @user.update_attribute(:score, @user.score + 1)
            if @user.score > @user.grade.score
              @user.update_attribute(:grade_id, @user.grade_id + 1)
            end
            self.logged_in_type = params[:logged_in_type]
            redirect_to panel_user_path(:id => @user)
          end
        else
          flash[:error] = "用户名/密码错误!"
        end
      when "Shop"
        reset_session
        if @shop = Shop.authenticate(params[:login_name],params[:password])
          self.logged_in_user = @shop
          self.logged_in_type = params[:logged_in_type]
          redirect_to shop_path(:id => @shop.id)
        else
          flash[:error] = "Error!"
        end
      when "Company"
        reset_session
        if @company = Company.authenticate(params[:login_name],params[:password])
          self.logged_in_user = @company
          self.logged_in_type = params[:logged_in_type]
          redirect_to company_path(:id => @company)
        else
          flash[:error] = "企业名/密码错误!"
        end
      end
    end
  end

  def logout
    reset_session
    flash[:notice] = '您已退出登录'
    redirect_to login_path
  end
end
