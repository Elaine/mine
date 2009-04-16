class UserInfosController < ApplicationController
  before_filter :login_required
  def edit
  end

  def update
    @user = User.find(params[:user_id])
    @userinfo = @space.user.user_info
    if @userinfo.update_attributes(params[:userinfo])
      flash[:notice] = "隐私设置完毕"
      redirect_to edit_userinfo_user_path(:id => @user)
    end
  end
end
