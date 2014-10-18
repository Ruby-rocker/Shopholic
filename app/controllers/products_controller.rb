class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  #current_product = Product.find(params[:id])
  before_filter :check_admin_role, except: [:index, :products_list]


require 'will_paginate/array'

  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def products_list
    @products = Product.all
    @orders = Order.all

    if(params[:name])
     
      session[:category] = Array.new
      session[:category]  << params[:name]
      
      @products = Product.where("(category_id IN (?)) ", session[:category][0])
      @products = @products.paginate(:page => params[:page])
    end
    
    if(params[:brand])
    
      session[:brand] = Array.new
      session[:brand] << params[:brand]

      @products = Product.where("(brand_id IN (?))", session[:brand][0])
    end

     if(params[:price])
       
       session[:price] = Array.new
       session[:price] = params[:price][0].to_s.split(/-/)

       @products = Product.where("(price IN (?))", session[:price][0]..session[:price][1])
    end
    @products = @products.paginate(:page => params[:page])
    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @products }
    end
  end
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }

      @categories = Category.all
      @brands = Brand.all
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])

    @categories = Category.all
    @brands = Brand.all    

  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def brand_list
    category = Category.find(params[:product_id])
    brands = category.brands
    abort brands.inspect
    abort params.inspect
  end
end