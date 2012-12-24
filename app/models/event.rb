class Event < ActiveRecord::Base
  has_many :registrations
  has_many :participants, :through => :registrations
  has_many :game_blocks, :order => "order_value ASC" 
  has_many :games, :order => "game_title ASC" 
  has_many :prices, :as => :pricable

  validates_presence_of :name, :startdate, :enddate
  
  def self.active_event
    Event.find(:first, :conditions => ['active=?',true])
  end
end
