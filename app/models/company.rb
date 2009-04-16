class Company < ActiveRecord::Base
  belongs_to :company_category
  has_many :infos, :as => :item
  has_many :comments, :as => :item
  has_many :posters, :class_name => 'Comment', :as => :poster
  has_many :products, :as => :item
  has_many :item_photos, :as => :item
  has_one :avatar, :as => :item, :class_name => 'ItemPhoto', :conditions => ["item_photos.avatar = ?", true]
 # has_one :avatar, :class_name => 'ItemPhoto', :conditions => ["item_photos.avatar = ?", true]
  acts_as_tagger

  validates_presence_of :login_name, :company_email, :message => '不能为空'
  #validates_presence_of :password, :message => '不能为空'
  validates_length_of :login_name, :within => 3..10, :too_short => '不能少于3个字符', :too_long => '不能超过10个字符'
  validates_uniqueness_of :login_name, :company_email, :message => '已经存在'
  validates_format_of :company_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => '的格式不正确'
  validates_confirmation_of :password, :message => '输入的不一致'
  attr_accessor :oldpassword
  ColumnNames = {
    :login_name => '企业名', :password => '密码', :company_email => '邮箱'
  }
  def self.human_attribute_name (attr)
    human_attribute_names = (self.const_defined? "ColumnNames") ? self::ColumnNames : {}
    human_attribute_names[attr.to_sym] || attr.humanize
  end
  def password
    @password
  end

  def password= (pwd)
    @password = pwd
    return if @password.blank?
    create_a_salt
    self.hashed_password = Company.encrypt_password(self.password, self.salt)
  end

  def self.authenticate(company_name,password)
    if  company = Company.find_by_login_name(company_name)
      if company.hashed_password != encrypt_password(password, company.salt)
         company = nil
      else
        company
      end
    end
  end

  private
  def create_a_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  def self.encrypt_password(password,salt)
    string_to_hash = password + 'D3JI' + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end
