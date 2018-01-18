class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string  :make, :model, :stock_number
      t.integer :auction_house_id, :year
      t.text    :description

      t.timestamps
    end
  end
end
