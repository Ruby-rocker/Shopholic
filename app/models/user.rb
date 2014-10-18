class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_one :wish_list
  has_many :orders
  has_many :auctions
  has_many :biddings
  has_many :ratings
  has_many :rated_auctions, :through => :ratings, :source => :auctions
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :address, :zipcode, :fname, :lname, :city, :zipcode, :state, :role
  # attr_accessible :title, :body
end