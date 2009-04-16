class CompanyCategory < ActiveRecord::Base
  has_many :companies
end
