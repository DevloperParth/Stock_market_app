# frozen_string_literal: true

class Currency < ApplicationRecord
  has_many :quantities
  has_many :users, through: :quantities
end
