class Auction < ApplicationRecord
  belongs_to :auction_house
  belongs_to :vehicle

  validates :vehicle_id, uniqueness: true

  before_save :calculate_profit

  def self.import(data)
    auction_house_data = data.slice(:street, :city, :state, :zip)
    vehicle_data = data.slice(:year, :make, :model, :stock_number)
    auction_data = data.slice(:winning_bid, :seller_payout)

    auction_house = AuctionHouse.where(name: data[:name]).first_or_create(auction_house_data)
    vehicle = Vehicle.where(vehicle_data.merge(auction_house_id: auction_house.id))
      .first_or_create(description: data[:description])

    create(auction_data.merge(auction_house_id: auction_house.id, vehicle_id: vehicle.id))
  end

  private
    def calculate_profit
      self.profit = self.winning_bid - self.seller_payout
    end
end
