class Attack < ApplicationRecord
  belongs_to :child
  belongs_to :bird
end
