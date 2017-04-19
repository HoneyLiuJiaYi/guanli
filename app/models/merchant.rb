class Merchant < ApplicationRecord
  has_secure_password
  has_many :merchant_categoryships
  has_many :categories, :through => :merchant_categoryships

  has_many :merchant_productships
  has_many :products, :through => :merchant_productships

  has_many :stations
end