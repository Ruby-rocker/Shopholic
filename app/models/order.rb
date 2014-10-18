class Order < ActiveRecord::Base
attr_accessible :baddress, :city, :price, :product_id, :quantity, :state, :status, :total_amount, :user_id, :zipcode, :mo_id

belongs_to :users
belongs_to :products
belongs_to :carts
belongs_to :master_order
end