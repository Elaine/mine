class InfoCategory < ActiveRecord::Base
  has_many :infos, :dependent => :destroy
end
