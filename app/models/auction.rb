class Auction < ActiveRecord::Base
  attr_accessible :description, :name, :reserved_price, :title, :user_id,:avatar,:auction_ended
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

belongs_to :user
has_many :biddings, :dependent => :destroy
has_many :ratings
has_many :raters, :through=> :ratings, :source=> :users

  def average_rating
    @value = 0
    self.ratings.each do |rating|
        @value = @value + rating.value
    end
    @total = self.ratings.size
    @value.to_f / @total.to_f
  end 
end