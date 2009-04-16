class ShopPhotosController < ApplicationController
  def destroy
    @product = Product.find(params[:product_id])
    @shopphoto = @product.shop_photos.find(params[:id])
    @shopphoto.destroy
    redirect_to shop_product_path(:id => @product, :shop_id => @product.shop)
  end
end
