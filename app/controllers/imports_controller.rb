class ImportsController < ApplicationController
  HEADERS ||= {
    name:         'auction name',
    street:       'street address',
    city:         'city',
    state:        'state',
    zip:          'zip',
    year:         'vehicle year',
    make:         'vehicle make',
    model:        'vehicle model',
    stock_number: 'vehicle stock number',
    winning_bid:  'winning bid',
    seller_payout: 'seller payout',
    description:  'description'
  }.freeze

  def create
    CSV.foreach(file).with_index do |row, index|
      if index.zero?
        @header = row.map { |name| HEADERS.key(name) }
      else
        data = @header.zip(row).to_h
        Auction.import(data)
      end
    end

    redirect_to imports_path
  end

  def show
    @auction_houses = AuctionHouse.eager_load(:vehicles, :auctions)
  end

  private
    def file
      data = params[:import][:file]
      if data.present?
        data.tempfile
      end
    end

    def header

    end
end
