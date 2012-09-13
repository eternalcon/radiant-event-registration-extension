# rake radiant:extensions:registration:migrate
class CreateRoomAuction < ActiveRecord::Migration
  def self.up
    create_table :room_auctions, :force => true do |t|
      t.integer :event_id
      t.string :room_name
      t.text :room_description
      t.date :auction_end_date
      t.timestamps
    end
    
    create_table :room_auction_bids, :force => true do |t|
      t.integer :room_auction_id
      t.text :bidder_full_name
      t.integer :bidder_email
      t.float :bidder_bid
      t.datetime :bidder_bid_date_time
      t.timestamps
    end
  end
  
  
  def self.down
    drop_table :room_auction_bids
    drop_table :room_auctions
  end
end