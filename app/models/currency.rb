class Currency < ApplicationRecord
  belongs_to :user, optional: true
end
