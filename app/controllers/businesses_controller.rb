class BusinessesController < ApplicationController
  def index
    @businesses = Business.find_all_by_serve_category_id(params[:category_id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = logged_in_user.businesses.new(params[:business])
    if @business.save
    redirect_to business_path(:id => @business)
    end
  end

  def show
    @business = Business.find(params[:id])
    @business.update_attributes(:views_count => @business.views_count + 1)
  end

  def add_gone
    @business = Business.find(params[:id])
    @business.update_attributes(:gone => @business.gone + 1)
    redirect_to :action => 'show', :id => @business
  end

  def add_want
    @business = Business.find(params[:id])
    @business.update_attributes(:want => @business.want + 1)
    redirect_to :action => 'show', :id => @business
  end
end
