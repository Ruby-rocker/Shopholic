class Category < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :brands
  has_many :products

end