class MasterCart < ActiveRecord::Base
  attr_accessible :cart_id, :total_amt, :user_id
  has_many :carts
  
  def paypal_url(return_url, cartprod)
    values = {
                :business => 'payment@shopaholic.com',
                :cmd => '_cart',
                :upload => 1,
                :return => return_url,
                :invoice => id,
                :cancel => 'localhost:3000/cancel'
              }
    cartprod.each_with_index do |item, index|
     
         @id = Product.find(item.Product_id)
        values.merge!({
          "amount_#{index+1}" => @id.price,
          "item_name_#{index+1}" => @id.name,
          "item_number_#{index+1}" => @id.id,
          "quantity_#{index+1}" => item.Quantity
        })
      end 
          "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end