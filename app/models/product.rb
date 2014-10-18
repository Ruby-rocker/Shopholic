class Product < ActiveRecord::Base
  attr_accessible :brand_id, :category_id, :description, :name, :price, :avatar,:available_quantity
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :category
  belongs_to :brand
  has_many :carts
  has_many :wish_lists
  has_many :orders
  WillPaginate.per_page = 12
end