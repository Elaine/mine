class Admin::GradesController < ApplicationController
  layout 'admin'
  def index
    @grades = Grade.find(:all, :order => 'name desc').paginate :page => params[:page], :per_page => 10
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(params[:grade])
    if @grade.save
      redirect_to :action => 'index'
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    redirect_to :action => 'index'
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update_attributes(params[:grade])
      redirect_to :action => 'index'
    end
  end
end
