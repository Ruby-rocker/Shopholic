class Bidding < ActiveRecord::Base
  attr_accessible :bidder, :bid_price, :user_id
  
  validates :bidder,  :presence => true
  validates :bid_price, :presence => true

  belongs_to :auction
  belongs_to :user
end