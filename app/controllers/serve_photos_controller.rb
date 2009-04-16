class ServePhotosController < ApplicationController
  def index
    @business = Business.find(params[:business_id])
  end

  def new
    @photo = ServePhoto.new
  end

  def create
    @business = Business.find(params[:business_id])
    @photo = ServePhoto.new(params[:servephoto])
    @photo.business = @business
    @photo.save
    redirect_to business_path(:id => @business)
  end

end
