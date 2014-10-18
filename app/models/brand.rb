class Brand < ActiveRecord::Base
  attr_accessible :brand_name, :description, :category_id
  belongs_to :categories
  has_many :products
end