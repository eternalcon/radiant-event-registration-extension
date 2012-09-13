# Uncomment this if you reference any of your controllers in activate
# require_dependency "application_controller"
require "radiant-event_registration-extension"

class EventRegistrationExtension < Radiant::Extension
  version     RadiantEventRegistrationExtension::VERSION
  description RadiantEventRegistrationExtension::DESCRIPTION
  url         RadiantEventRegistrationExtension::URL

  # See your config/routes.rb file in this extension to define custom routes

  extension_config do |config|
    # config is the Radiant.configuration object
  end

  def activate
    tab 'Content' do
       add_item "Participants", "/admin/participants", :after => "Pages"
       add_item "Events", "/admin/events", :after => "Participants"
       add_item "Prices", "/admin/prices", :after => "Events"
       add_item "Categories", "/admin/categories", :after => "Prices"
     end
     
     I18n.load_path += Dir[ File.join(RAILS_ROOT, 'vendor/extensions/event_registration/config', 'locales', '*.{yml}') ]
     Page.send :include, EventRegistrationTags
     Page.send :include, GameAnnouncementTags
     Page.send :include, AuctionBidTags

  end
end
