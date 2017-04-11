class Admin < ApplicationRecord
  has_secure_password
  has_one :role
end
