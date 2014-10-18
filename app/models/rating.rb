class Rating < ActiveRecord::Base
  attr_accessible :auction_id, :user_id, :value

  belongs_to :auction
  belongs_to :user
end
