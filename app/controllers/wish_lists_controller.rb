class WishListsController < ApplicationController
	

  def index
    @wish_lists = WishList.all

    respond_to do |format|
    format.html # index.html.erb
    end
  end

  def new
      @wish_list = WishList.new
      respond_to do |format|
      format.html # new.html.erb

      @categories = Category.all
    end
  end

  def add_to_wish_list
      @wish_list = WishList.find_by_product_id_and_user_id( params[:product_id], current_user.id)
      if @wish_list.nil?
      @wish_list = WishList.create(:user_id => current_user.id, :product_id => params[:product_id], :quantity => '1')
      else 
        @wish_list=WishList.find_by_product_id(params[:product_id])
        @wish_list.quantity += 1
        @wish_list.save
      end

      redirect_to view_wish_list_path
  end

   def view_wish_list
         @wish_lists = WishList.all
   end

  def update_wish_list
   
    params[:quantity].each do |key,value|  
    @wish_list = WishList.find(key)
     
    @wish_list.update_attributes(:id => key, :quantity => value)
    end
        respond_to do |format|
        format.html { redirect_to view_wish_list_path, notice: 'Wish List was successfully updated.' }
    end
  end

 end