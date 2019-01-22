class Child < ApplicationRecord
  has_many :attacks
  has_many :birds, through: :attacks
  has_secure_password
end
