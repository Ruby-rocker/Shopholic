class RatingsController < ApplicationController

  def create
      @auction = Auction.find_by_id(params[:auction_id])
    if current_user.id == @auction.user_id
       redirect_to auction_path(@auction), :alert => "You cannot rate for your own Auction Post"
    else
       @rating = Rating.new(params[:rating])
       @rating.auction_id = @auction.id
       @rating.user_id = current_user.id
       if @rating.save
        respond_to do |format|
           format.html { redirect_to auction_path(@auction), :notice => "Your rating has been saved" }
          end
       end
     end
  end

  def update
    @auction = Auction.find_by_id(params[:auction_id])
    if current_user.id == @auction.user_id
       redirect_to auction_path(@auction), :alert => "You cannot rate for your own Auction Post"
    else
       @rating = current_user.ratings.find_by_auction_id(@auction.id)
        if @rating.update_attributes(params[:rating])
              respond_to do |format|
                  format.html { redirect_to auction_path(@auction), :notice => "Your rating has been updated" }
              end
        end
    end
  end
end