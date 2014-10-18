module AuctionsHelper

def rating_ballot
    @auction = Auction.find(params[:id])
    if @auction = current_user.ratings.find_by_auction_id(params[:id])
        abort @auction.inspect
        @auction
    else
      @auction = Auction.find(params[:id])
      current_user.ratings.new
    end
end

def current_user_rating
    if @auction = current_user.ratings.find_by_auction_id(params[:id])
        @auction.value
    else
		nil
    end
end

end