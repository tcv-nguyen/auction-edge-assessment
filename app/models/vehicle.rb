class Vehicle < ApplicationRecord
  has_one :auction
  belongs_to :auction_house

  # validates :stock_number, uniqueness: true # Should be unique or at least with auction_house_id
end
