class GameBlock < ActiveRecord::Base
  belongs_to :event
  
  validates_presence_of :event
  validates_presence_of :day
  validates_presence_of :order_value
end
