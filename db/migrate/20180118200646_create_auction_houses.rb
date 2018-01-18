class CreateAuctionHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :auction_houses do |t|
      t.string  :name, :street, :city, :state, :zip

      t.timestamps
    end
  end
end
