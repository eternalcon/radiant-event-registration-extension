class RoomAuctionBid < ActiveRecord::Base
  belongs_to :room_auction

  validates_presence_of :room_auction
  validates_presence_of :bidder_full_name
  validates_presence_of :bidder_email
  validates_presence_of :bidder_bid
end