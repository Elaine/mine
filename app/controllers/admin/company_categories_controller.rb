class Admin::CompanyCategoriesController < ApplicationController
  layout 'admin'
  def index
    @categories = CompanyCategory.find(:all, :order => 'name desc').paginate :page => params[:page], :per_page => 16
    @category = CompanyCategory.new
  end

  def show
    @category = CompanyCategory.find(params[:id])
    @companies = @category.companies.find(:all, :order => 'created_at desc').paginate :page => params[:page], :per_page => 16
  end

  def create
    @category = CompanyCategory.new(params[:companycategory])
    if @category.save
      redirect_to :action => 'index'
    end
  end

  def destroy
    @category = CompanyCategory.find(params[:id])
    @category.destroy
    redirect_to :action => 'index'
  end
end
