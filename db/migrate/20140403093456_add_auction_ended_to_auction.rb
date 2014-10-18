class AddAuctionEndedToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :auction_ended, :datetime
  end
end
