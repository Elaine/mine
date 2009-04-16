class Admin::ForumCategoriesController < ApplicationController
  layout 'admin'

  def index
    @forumcategories = ForumCategory.find(:all, :order => 'created_at desc').paginate :page => params[:page], :per_page => 16
    @forumcategory = ForumCategory.new
  end

  def create
    @forumcategory = ForumCategory.new(params[:forumcategory])
    if @forumcategory.save
      redirect_to :action => 'index'
    end
  end

  def destroy
    @forumcategory = ForumCategory.find(params[:id])
    @forumcategory.destroy
    redirect_to :action => 'index'
  end

end
