class Admin::InfoCategoriesController < ApplicationController
  layout 'admin'
  def index
    @infocategories = InfoCategory.find(:all, :order => 'name desc').paginate :page => params[:page], :per_page => 10
    @infocategory = InfoCategory.new
  end

  def create
    @infocategory = InfoCategory.new(params[:infocategory])
    if @infocategory.save
      redirect_to :action => 'index'
    end
  end

  def destroy
    @infocategory = InfoCategory.find(params[:id])
    @infocategory.destroy
    redirect_to :action => 'index'
  end
end
