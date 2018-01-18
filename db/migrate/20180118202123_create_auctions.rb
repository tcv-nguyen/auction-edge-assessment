class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.integer :auction_house_id, :vehicle_id
      t.decimal :winning_bid, :seller_payout, :profit

      t.timestamps
    end
  end
end
