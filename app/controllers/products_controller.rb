class ProductsController < ApplicationController
  before_filter :login_required, :except => [:show]
  def new
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => 'name desc')
    @product = Product.new
    @photo = ItemPhoto.new
  end

  def create
    if logged_in_type == "Shop"
      @item = Shop.find(params[:item_id])
    elsif logged_in_type == "Company"
      @item = Company.find(params[:item_id])
    end
    @product = @item.products.new(params[:product])
    if logged_in_type == "Shop"
      @product.shop_category = @item.shop_category
    end
    #@product.item_id = @item.id
    if @product.save
      @photo = ItemPhoto.new(params[:item_photo])
      @photo.item_id = @item.id
      @photo.item_type = logged_in_type
      @photo.product = @product
      @old_avatar = @product.item_photos.select(&:avatar?)
      if @photo.update_attributes(:avatar => true)
        @old_avatar.each { |p| p.update_attributes!(:avatar => false) }
       end
       @photo.save

     # @shop.tag(@product, :with => params[:tags][:name], :on => :tags)
      flash[:notice] = "产品添加成功"
      redirect_to product_path(:id => @product)
    else
      flash[:error] = "Error#{params[:item_id]}#{logged_in_type}#{params[:product]}"
      redirect_to :action => 'new'
    end
  end

  def show
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => 'name desc')
    @product = Product.find(params[:id])
  end

  def edit
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => 'name desc')
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
    redirect_to product_path(:id => @product)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
 end
end
