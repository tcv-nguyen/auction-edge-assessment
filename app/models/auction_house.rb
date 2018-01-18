class AuctionHouse < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  has_many :auctions, dependent: :destroy

  validates :name, presence: true
end
