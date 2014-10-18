class OrdersController < ApplicationController

  def confirm_order
   @carts = current_user.carts
   @products = Product.all 
   @master_cart = MasterCart.new
    respond_to do |format|
      format.html
    end 
  end

  def thank_you
    
    @order = Order.new
    @order.user_id = current_user.id
    @cart = current_user.carts
    @product = Product.all
    #abort params[:total_amt]
    sum = 0
    @cart.each do |cart|
      if cart.User_id = current_user.id
        @id = Product.find(cart.Product_id)
        sum = cart.Quantity*@id.price + sum
      end  
    end
    @master_order = MasterOrder.create(:total_amt =>sum,:user_id => current_user.id)



    @cart.each do |cart|
      if cart.User_id = current_user.id
        @id = Product.find(cart.Product_id)
        
        #abort @master_order.id.inspect
        Order.create(:product_id => cart.Product_id, :quantity => cart.Quantity,
        :user_id => current_user.id, :price => @id.price, :total_amount => cart.Quantity*@id.price,
        :baddress => current_user.address, :zipcode => current_user.zipcode,
        :city => current_user.city, :state => current_user.state, :mo_id => @master_order.id)
        
        cart.destroy
      end 
    end
    respond_to do |format|
  	  format.html  # thank_you.html.erb
    end
  end

  def cancel
    respond_to do |format|
      format.html # cancel.html.erb
    end
  end
  
  def index
    @master = MasterOrder.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def show
    @order = Order.all
    @orders = Order.where("(mo_id IN (?))", params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end



end
  # def create
  #    @order = Order.create(params[:order])
# 
  # 	 respond_to do |format|
  # 	 	if @order.save
  # 	 		format.html { redirect_to @order, notice: 'Order was successfully created.' }
  # 	 	else
  # 	 		format.html { render action: "new"}
  # 	 	end
  # 	 end
  # end

  # def edit
  #    @order = Order.find(params[:id])
  # end

  # def update
  # 	@order = Order.find(params[:id])

  # 	respond_to do |format|
  # 		if @order.update_attributes(params[:order])
  # 			format.html { redirect_to @order, notice: 'Order was successfully updated.'}
  # 		else
  # 			format.html { render action: "edit"}
  # 		end
  # 	end
  # end



  # def destroy
  #   @order = Order.find(params[:id])
  #   @order.destroy

  #   respond_to do |format|
  #     format.html { redirect_to orders_url }
  #   end
  # end
