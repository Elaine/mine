class VoteController < ApplicationController
  def home
    @servecategories = ServeCategory.find(:all, :conditions => {:parent_id => nil})
    @children = ServeCategory.find_by_sql ["SELECT * FROM serve_categories where parent_id > ?",0] 
  end

  def index
    @servecategories = ServeCategory.find(:all, :conditions => {:parent_id => nil})
    @category = ServeCategory.find(params[:id])
  end

  def new
    @servecategories = ServeCategory.find(:all, :conditions => {:parent_id => nil})
    @business = Business.find(params[:business_id])
    @vote = @business.votes.new
  end

  def create
    @business = Business.find(params[:business_id])
    @vote = @business.votes.new(params[:vote])
    @vote.user = logged_in_user
    @vote.save
    redirect_to business_path(:id => @business)
  end
end
