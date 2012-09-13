class RoomAuction < ActiveRecord::Base
  belongs_to :event
  has_many :room_auction_bids, :dependent => :destroy, :order => "bidder_bid_date_time DESC"
  
  validates_presence_of :event
  
  def highest_bid
    RoomAuctionBid.find(:first,
                        :conditions => ['room_auction_id=?', self],
                        :order => "bidder_bid DESC")
  end
end