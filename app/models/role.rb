class Role < ApplicationRecord
  belongs_to :admin
  has_many :role_authorityships
  has_many :authorities, :through => :role_authorityships
end
