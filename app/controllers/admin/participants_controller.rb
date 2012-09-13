#encoding: utf-8

class Admin::ParticipantsController < ApplicationController
  
  def index
    @event = Event.active_event
    @registrations = Registration.find( :all, 
                                        :include => :participant,  
                                        :conditions => ['event_id=?', @event], 
                                        :order => "participants.last_name DESC")
  end

end
