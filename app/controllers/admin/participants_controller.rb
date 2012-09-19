#encoding: utf-8

class Admin::ParticipantsController < ApplicationController
  
  def index
    @event = Event.active_event
    @registrations = Registration.find( :all, 
                                        :include => :participant,  
                                        :conditions => ['event_id=?', @event], 
                                        :order => "registrations.created_at ASC")
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    redirect_to admin_participants_path
  end
end
