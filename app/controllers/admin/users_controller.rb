class Admin::UsersController < ApplicationController
  layout 'admin'

  def index
    @users = User.find(:all, :order => 'created_at desc').paginate :page => params[:page], :per_page => 10
  end

  def enabled
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, true)
      redirect_to :action => 'index'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, false)
      redirect_to :action => 'index'
    end
  end
end
