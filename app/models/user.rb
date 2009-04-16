class User < ActiveRecord::Base
  after_destroy :last
  acts_as_tagger
  acts_as_taggable_on :skills, :interests
  has_many :infos, :as => :item
  has_many :votes, :dependent => :destroy
  has_many :businesses
  has_many :eventors
  has_many :events, :through => :eventors
  belongs_to :role
  belongs_to :grade
  has_one :user_info
  has_one :space
  has_many :answers, :dependent => :destroy
  has_many :asks, :dependent => :destroy
  has_many :visits
  has_many :boards, :dependent => :destroy
  has_many :activities, :order => 'activities.created_at DESC', :limit => 3, :include => :user
  has_many :messages, :dependent => :destroy
  has_many :friendships
  has_many :friends, :through => :friendships, :class_name => 'User'
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :albums, :dependent => :destroy
  has_many :entries, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_one :avatar, :class_name => 'Photo', :conditions => ["photos.avatar = ?", true]
  has_many :comments, :as => :item

  validates_presence_of :login_name, :email, :password, :message => '不能为空'
  validates_length_of :login_name, :within => 3..10, :too_short => '不能少于3个字符', :too_long => '不能超过10个字符'
  validates_uniqueness_of :login_name, :email, :message => '已经存在'
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => '的格式不正确'
  validates_confirmation_of :password, :email, :message => '输入的不一致'
  attr_accessor :oldpassword

  ColumnNames = {
    :login_name => '用户名', :password => '密码', :email => '邮箱'
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
    self.hashed_password = User.encrypt_password(self.password, self.salt)
  end

  def self.authenticate(login_name,password)
    if user = User.find_by_login_name(login_name)
      if user.hashed_password != encrypt_password(password, user.salt)
        user = nil
      else
        user
      end
    end
  end

  def last
    self.update_attribute(:last_activity, Time.now)
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
