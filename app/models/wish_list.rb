class WishList < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :user_id
  belongs_to :product
  belongs_to :user
end
