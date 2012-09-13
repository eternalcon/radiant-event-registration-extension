#encoding: utf-8

class Admin::AdminRoomAuctionBidsController < ApplicationController
  before_filter :bf_find_event, :bf_find_room_auction
  
  def new
    @ra_bid = RoomAuctionBid.new
    @ra_bid.room_auction = @room_auction
    @ra_bid.bidder_bid_date_time = Time.now
  end
  
  def create
    @ra_bid = RoomAuctionBid.new(params[:ra_bid])
    @ra_bid.room_auction = @room_auction
    @ra_bid.bidder_bid_date_time = DateTime.parse(params[:ra_bid][:bidder_bid_date_time])
    
    if @ra_bid.save
      redirect_to admin_event_room_auctions_path(@event, @room_auction, :notice => 'BID was successfully created.')
    else
      flash[:error] = "There have been errors"
      render :action => :new   
    end
  end
  
private    
  def bf_find_room_auction
    @room_auction = RoomAuction.find(params[:room_auction_id])
  end

  def bf_find_event
    @event = Event.find(params[:event_id])
  end
end
