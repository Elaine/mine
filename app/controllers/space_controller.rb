class SpaceController < ApplicationController
  before_filter :login_required, :except => [:show]
  #after_filter :recent_visit
  
  def edit
    @user = User.find(params[:id])
    @spae = @user.space
    @categories = ThemeCategory.find(:all, :order => 'created_at desc')
  end

  def update
    @user = User.find(params[:id])
    @space = @user.space
    if @space.update_attributes(params[:space])
      redirect_to panel_user_path(:id => @space)
    else
      render :action => 'edit'
    end
  end

end
