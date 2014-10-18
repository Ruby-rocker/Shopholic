class BiddingsController < ApplicationController

  def create
    
    @auction = Auction.find(params[:auction_id])
    @bid = Bidding.where("(auction_id IN (?))", @auction.id).last
    bid_accepted = (@auction.reserved_price*0.02 + @auction.reserved_price)
    
    if @bid == nil
      if bid_accepted < params[:bidding][:bid_price].to_i
         @bidding = @auction.biddings.create(params[:bidding])
         flash[:notice] = "Bid accepted"
      else
         flash[:notice] = "Bid more then 2% of Reserved Price"
      end
    else
      if bid_accepted < params[:bidding][:bid_price].to_i && ((@bid.bid_price)*0.02 + @bid.bid_price) < params[:bidding][:bid_price].to_i
         @bidding = @auction.biddings.create(params[:bidding])
         flash[:notice] = "Bid accepted"
      else
         flash[:notice] = "Bid more then 2% of last bid"
      end
    end
    redirect_to auction_path(@auction)
  end

  def destroy
    @auction = Auction.find(params[:auction_id])
    @bidding = @auction.biddings.find(params[:id])
    @bidding.destroy
    redirect_to auction_path(@auction)
  end
end