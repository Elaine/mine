module LoginSystem
  protected

  #¿¿
#  def company_logged_in?
#    session[:company]
#  end
#
#  def logged_in_company
#    @logged_in_company = session[:company] if company_logged_in?
#  endcompany
#
#  def logged_in_company= (company)
#    unless company.nil?
#      session[:company] = company
#    end
#  end
#  def company_login_required
#    unless company_logged_in?
#      flash[:error] = "¿¿¿¿"
#      redirect_to logincompany_path
#    end
#  end
#
#  #¿¿
#  def shop_logged_in?
#    session[:shop]
#  end
#
#  def logged_in_shop
#    @logged_in_shop = session[:shop] if shop_logged_in?
#  end
#
#  def logged_in_shop= (shop)
#    unless shop.nil?
#      session[:shop] = shop
#    end
#  end
#  def shop_login_required
#    unless shop_logged_in?
#      flash[:error] = "¿¿¿¿"
#      redirect_to loginshop_path
#    end
#  end


#¿¿
  #¿¿¿¿¿+¿¿+¿¿
  def is_logged_in?
    session[:user]
  end

  def logged_in_user
    @logged_in_user  = session[:user] if is_logged_in?
  end

  def logged_in_type
    @logged_in_type = session[:type] if is_logged_in?
  end

  def logged_in_type=(type)
    unless type.nil?
      session[:type] = type
    end
  end

  def logged_in_user= (user)
    unless user.nil?
      session[:user] = user
    end
  end

  def login_required
    unless is_logged_in?
      flash[:error] = "¿¿¿¿¿¿¿¿¿¿¿"
      redirect_to login_path
    end
  end

  #¿¿¿
  def admin_logged_in?
    @logged_in_admin = session[:admin] if session[:admin]
  end

  def logged_in_admin
    @logged_in_admin if admin_logged_in?
  end

  def logged_in_admin= (admin)
    unless admin.nil?
      session[:admin] = admin
      @logged_in_admin = admin
    end
  end

  def admin_login_required
    unless admin_logged_in?
      flash[:error] = "¿¿¿¿"
      redirect_to :controller => 'admin/home', :action => 'login'
    end
  end
  def self.included(base)
    base.send :helper_method, :is_logged_in?, :logged_in_user, :logged_in_type, :admin_logged_in?, :logged_in_admin#, :logged_in_shop, :shop_logged_in?, :logged_in_company, :company_logged_in?
  end
end
