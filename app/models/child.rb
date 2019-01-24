class Child < ApplicationRecord
  has_many :attacks
  has_many :birds, through: :attacks
  validates :name, length:{ minimum: 3, maximum: 15}
  validates :password, length:{ minimum: 5, maximum: 15}
  validates :name, :password, presence: true
  has_secure_password
end
