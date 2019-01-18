class Bird < ApplicationRecord
  has_many :attacks
  has_many :children, through: :attacks
end
