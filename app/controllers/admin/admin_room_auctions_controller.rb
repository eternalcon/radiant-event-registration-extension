#encoding: utf-8

class Admin::AdminRoomAuctionsController < ApplicationController
  before_filter :bf_find_event
    
  def index 
    @actual_auction = RoomAuction.find( :first,
                                        :conditions => ['event_id=?',@event])    
    if @actual_auction.blank?
      @room_auction = RoomAuction.new 
      @room_auction.event = @event
      @room_auction.auction_end_date = Date.today
    end
  end 
    

  def create
   @room_auction = RoomAuction.new(params[:room_auction])
   @room_auction.event = @event
   
    if @room_auction.save 
      redirect_to(:action =>"index", :notice => 'Room Auction was successfully created.', :event_id => @event )
    else
      flash[:error] = "Auktion konnte nicht gespeichert werden"
      render_action "/admin/room_auction/index"
    end
  end
  

private    
  def bf_find_event
    @event = Event.find(params[:event_id])
  end
end
