class Admin::EventCategoriesController < ApplicationController
  def create
    @eventcategory = EventCategory.new(params[:eventcategory])
    if @eventcategory.save
      redirect_to :action => 'index'
    end
  end

  def index
    @eventcategories = EventCategory.find(:all, :order => 'created_at desc').paginate :page => params[:page], :per_page => 16
    @eventcategory = EventCategory.new
  end

  def destroy
    @eventcategory = EventCategory.find(params[:id])
    @eventcategory.destroy
    redirect_to :action => 'index'
  end
end
