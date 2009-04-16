class CompanyController < ApplicationController
  def index
    #最新加盟企业
    @new_companies = Company.find(:all, :order => 'created_at desc', :limit => 8)
    #企业黄页
    @company_categories = CompanyCategory.find(:all, :order => 'created_at desc', :limit => 8)
    #企业招聘
    @company_invites = Info.find(:all, :conditions => ["item_type = ? and info_category_id = ?", "Company", 10],:order => 'created_at desc', :limit => 8)
    #供求信息
    @company_supplies = Info.find(:all, :conditions => ["item_type = ? and info_category_id = ?", "Company", 11],:order => 'created_at desc', :limit => 8)
  end

  def category_index
    @companies = Company.find_all_by_company_category_id(params[:category_id], :order => 'created_at desc')
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      @photo = @company.company_photos.new(params[:company_photo])
      @photo.save
      @old_primary = @company.company_photos.select(&:avatar?)
      if @photo.update_attributes(:avatar => true)
        @old_primary.each {|p| p.update_attributes!(:avatar => false) }
      end
      reset_session
      self.logged_in_user= @company
      self.logged_in_type= params[:logged_in_type]
      flash[:notice] = "企业注册成功"
      redirect_to company_index_path
    else
      render :action => 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
    @company.update_attributes(:views_count => @company.views_count + 1)
  end

  def edit
    @company = Company.find(params[:id])
  end
  #  def edit_password
  #    if request.post?
  #      @company = Company.find(params[:id])
  #      if @company.hashed_password == Company.encrypt_password(params[:company][:oldpassword], @company.salt)
  #        if params[:company][:password] == params[:company][:password_confirmation]
  #          @company.update_attributes(params[:company])
  #          flash[:notice] = "密码更改完毕"
  #            redirect_to company_path(:id => @company)
  #        else
  #          flash[:error] = "两次密码不一致!"
  #          render :action => 'edit_password'
  #        end
  #      else
  #      end
  #        flash[:error] = "当前密码输入错误"
  #        render :action => 'edit_password'
  #    end
  #  end
  def edit_password
    if request.post?
      @company = Company.find(params[:id])
      if @company.hashed_password == Company.encrypt_password(params[:company][:oldpassword], @company.salt)
        if @company.update_attributes!(params[:company])
          flash[:notice] = "密码更改完毕"
          redirect_to company_path(:id => @company)
        end
      end
    else
      flash[:error] = "当前密码输入错误"
      render :action => 'edit_password'
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to company_path(:id => params[:id])
    else
      flash[:error] = "#{params[:company]}"
      render :action => 'edit'
    end
  end
end
