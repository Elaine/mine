class ShopsController < ApplicationController
  before_filter :login_required, :only => [:edit]
  def index
    #  @category = ShopCategory.find(params[:category_id])
    #  unless @category.parent_id.nil?
    #    @categories = ShopCategory.find_all_by_parent_id(@category.parent_id)
    #  end
    # @shops = Shop.find_all_by_shop_category_id(params[:category_id])
    @shops = Shop.find(:all)
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => 'name desc')
    @marrycategory = ShopCategory.find_by_name("摄影婚庆")
    @housecategory = ShopCategory.find_by_name("家具")
  end
  def new
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => 'name desc')
    @shop = Shop.new
  end

  def create
    if request.post?
      @shop = Shop.new(params[:shop])
      @invitecode = InviteCode.new
      @invitecode.login_name = params[:shop][:login_name]
      @invitecode.password = params[:shop][:password]
      @shop.save
      @invitecode.save
      flash[:notice] = "商铺添加成功. login_name :#{params[:shop][:login_name]}/ password: #{params[:shop][:password]}"
      redirect_to adminhome_path(:id => logged_in_admin)
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => 'name desc')
    @posters = @shop.comments.paginate :page => params[:page], :per_page => 6
    @recommend_products = @shop.products.find(:all, :conditions => ["is_recommend = ?", true])
  end

  def category_shops
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => 'name desc')
    @category = ShopCategory.find(params[:category_id])
    @shops = Shop.find(:all)
  end

  def edit
    @categories = ShopCategory.find(:all, :conditions => {:parent_id => nil}, :order => 'name desc')
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
      @photo = @shop.item_photos.new(params[:shop_photo])
      @photo.save

      @old_primary = @shop.item_photos.select(&:avatar?)
      if @photo.update_attributes(:avatar => true)
        @old_primary.each {|p| p.update_attributes!(:avatar => false) }
      redirect_to shop_path(:id => @shop)
      end
    end
  end
end
