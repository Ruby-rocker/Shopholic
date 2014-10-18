class MasterOrder < ActiveRecord::Base
  attr_accessible :status, :total_amt, :user_id
  has_many :orders
end
