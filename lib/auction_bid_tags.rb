module AuctionBidTags
  include Radiant::Taggable
  include ActionView::Helpers::NumberHelper
  
  desc %{
    Return Information for an Auction an some bidding
  }
  tag 'auction_description' do |tag|
    room_auction = RoomAuction.find(tag.attr['auction_id'])
    unless room_auction.blank?
      %{#{room_auction.room_description}}
    end
  end
  
  tag 'auction_highest_bid' do |tag|
    room_auction = RoomAuction.find(tag.attr['auction_id'])
    
    unless room_auction.blank?
      %{#{number_to_currency(room_auction.highest_bid.bidder_bid,:precision => 2, :locale => :de)}}
    end
  end
  
  tag 'auction_highest_bidder' do |tag|
    room_auction = RoomAuction.find(tag.attr['auction_id'])
    
    unless room_auction.blank?
      %{#{room_auction.highest_bid.bidder_full_name}}
    end
  end
  
  tag 'auction_highest_bid_date' do |tag|
    room_auction = RoomAuction.find(tag.attr['auction_id'])
    
    unless room_auction.blank?
      %{#{room_auction.highest_bid.bidder_bid_date_time.strftime("%Y-%m-%d at %I:%M%p")}}
    end
  end
  
  tag 'auction_end_of_auction' do |tag|
    room_auction = RoomAuction.find(tag.attr['auction_id'])
    unless room_auction.blank?
      %{#{room_auction.auction_end_date.strftime("%Y-%m-%d")}}
    end
  end
  
  tag 'auction_bidding_summary' do |tag|
    room_auction = RoomAuction.find(tag.attr['auction_id'])
    txt = %{<table width="100%" cellpadding="0" cellspacing="0"><tbody>}
    txt += %{<tr><th>name of bidder</th><th>date of bid</th><th>bid</th>} 
     
    room_auction.room_auction_bids.each do |bid|
      txt += %{<tr><td>#{bid.bidder_full_name}</td>}
      txt += %{<td>#{bid.bidder_bid_date_time.strftime("%Y-%m-%d at %I:%M%p")}</td>}
      txt += %{<td>#{number_to_currency(bid.bidder_bid, :precision => 2, :locale => :de)}</td></tr>}
    end 

    txt += %{}
    txt += %{</tbody></table>}
    return txt
  end
  
  #{}%{link_to("´Signup Now/Jetzt Anmelden", new_event_freeform_registratio_path(freeform.event, freeform))}
  #return link_to("´Signup Now/Jetzt Anmelden", new_event_freeform_registration_path(freeform.event, freeform))
  #return "<a href='events/#{freeform.event.id}/freeforms/#{freeform.id}/registrations/new'>Signup Now/Jetzt Anmelden</a>"
  
#  <r:link link='/events/1/freeforms/the-injustice-syndicate/registrations/new'>Signup Now/Jetzt Anmelden</r:link>

  
end