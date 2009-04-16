class Admin::BoardCategoriesController < ApplicationController
  layout 'admin'
  def create
    @boardcategory = BoardCategory.new(params[:boardcategory])
    if @boardcategory.save
      redirect_to :action => 'index'
    end
  end

  def index
    @boardcategories = BoardCategory.find(:all, :order => 'created_at desc').paginate :page => params[:page], :per_page => 16
    @boardcategory = BoardCategory.new
  end

  def destroy
    @boardcategory = BoardCategory.find(params[:id])
    @boardcategory.destroy
    redirect_to :action => 'index'
  end
end
