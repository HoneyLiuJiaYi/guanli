class Role < ApplicationRecord
  has_many :admins
  has_many :role_authorityships
  has_many :authorities, :through => :role_authorityships
end
