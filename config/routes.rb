ActionController::Routing::Routes.draw do |map|
    map.resource :registration
    map.resources :events do |event|
      event.resources :freeforms do |freeform|
        freeform.resources :registrations, :controller => "freeform_registrations" 
      end
      event.resources :game_announcements, :controller => "game_announcements"
    end
    
    map.namespace :admin do |admin|
      admin.resources :participants, :collection => {:show_shuttle => :get, :show_thursday => :get}
      admin.resources :events do |event|
        event.resources :freeforms, :controller => "admin_freeforms" do |freeform|
          freeform.resources :participants, :controller => "admin_freeform_participants" 
        end 
        event.resources :room_auctions, :controller => "admin_room_auctions" do |room_auction|
          room_auction.resources :bids, :controller => "admin_room_auction_bids"
        end 
        event.resources :blocks, :controller => "admin_blocks"
      end
    end
end
