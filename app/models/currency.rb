class Currency < ApplicationRecord
  has_many :quantities
  has_many :users, through: :quantities
end
