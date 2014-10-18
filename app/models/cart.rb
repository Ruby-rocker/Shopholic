class Cart < ActiveRecord::Base
  attr_accessible :Product_id, :Quantity, :User_id
  belongs_to :product
  belongs_to :user
  has_many :orders

#  def paypal_url(return_url)
  
 
# values = {
#     :business => 'vasant.prajapati@softwebsolutions.comm',
#     :cmd => '_cart',
#     :upload => 1,
#     :return => return_url,
#     :invoice => 2,
#     #:cancel => 'localhost:3000/categories'
#   }
#     values.merge!({
#       "amount_#{1}" => 1000,
#       "item_name_#{1}" =>  "leptop",
#       "item_number_#{1}" => 1,
#       "quantity_#{1}" => 1
#     })
  
#   "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
# end
end