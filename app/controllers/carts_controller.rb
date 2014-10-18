class CartsController < ApplicationController
before_filter :authenticate_user!

  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  def new
      @cart = Cart.new
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }

      @categories = Category.all
    end
  end
  
  def add_to_cart
      @cart = Cart.find_by_Product_id_and_User_id( params[:product_id], current_user.id)
      if @cart.nil?
        @cart = Cart.create(:User_id => current_user.id, :Product_id => params[:product_id], :Quantity => '1')
      else 
        @cart=Cart.find_by_Product_id(params[:product_id])
        @cart.Quantity += 1
        @cart.save
      end

      redirect_to view_cart_path
  end

  def view_cart
      @carts = Cart.all
  end

  def update_cart
   
    params[:Quantity].each do |key,value|  
    @cart = Cart.find(key)
     
     @cart.update_attributes(:id => key, :Quantity => value)
    end
        respond_to do |format|
          format.html { redirect_to view_cart_path, notice: 'Cart was successfully updated.' }
    end
  end

  def destroy

  end
end