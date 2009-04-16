class Admin::AskCategoriesController < ApplicationController
  layout 'admin'
  def create
    @askcategory = AskCategory.new(params[:askcategory])
    if @askcategory.save
      redirect_to :action => 'index'
    end
  end

  def index
    @askcategories = AskCategory.find(:all, :order => 'created_at desc').paginate :page => params[:page], :per_page => 16
    @askcategory = AskCategory.new
  end

  def destroy
    @askcategory = AskCategory.find(params[:id])
    @askcategory.destroy
    redirect_to :action => 'index'
  end
end
