class FreeformRegistration < ActiveRecord::Base
  belongs_to :freeform
  belongs_to :participant
  
  validates_presence_of :participant
  validates_presence_of :freeform
end
