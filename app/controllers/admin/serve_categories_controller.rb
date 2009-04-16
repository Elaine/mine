class Admin::ServeCategoriesController < ApplicationController
  layout 'admin'
  def index
    @servecategories = ServeCategory.find(:all, :conditions => {:parent_id => nil }).paginate :page => params[:page], :per_page => 16
    @servecategory = ServeCategory.new
  end

  def select_with_ajax
    if params[:parent_id]
      @children = ServeCategory.find_all_by_parent_id(params[:parent_id]).map{|c| [c.name,c.id]}
    else
      @children = ServeCategory.find(:all)
    end
  end

  def create
    @servecategory = ServeCategory.new(params[:servecategory])
    if @servecategory.save
      redirect_to :action => 'index'
    end
  end

  def show
    @children = ServeCategory.find_all_by_parent_id(params[:id]).paginate :page => params[:page], :per_page => 10
  end

  def destroy
    @servecategory = ServeCategory.find(params[:id])
    @servecategory.destroy
    redirect_to :action => 'index'
  end
end
