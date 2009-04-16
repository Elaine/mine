class ReservationsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @reservation = Reservation.new
  end

  def create
    @product = Product.find(params[:product_id])
    @reservation = @product.reservations.create(params[:reservation])
    flash[:notice] = "Ok"
    redirect_to shop_product_path(:id => @product, :shop_id => @product.shop)
  end
end
