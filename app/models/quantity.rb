# frozen_string_literal: true

class Quantity < ApplicationRecord
  belongs_to :user
  belongs_to :currency
end
