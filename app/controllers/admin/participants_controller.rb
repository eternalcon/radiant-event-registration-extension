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

  def show_shuttle
    @event = Event.active_event
    @participants = Participant.find( :all, 
                                      :include => :registrations,  
                                      :conditions => ['registrations.event_id=? AND registrations.shuttle_from_hahn = ?', @event, true], 
                                      :order => "registrations.created_at ASC")
  end
  def show_thursday
    @event = Event.active_event
    @participants = Participant.find( :all, 
                                      :include => :registrations,  
                                      :conditions => ['registrations.event_id=? AND registrations.accomodation_for_thursday = ?', @event, true], 
                                      :order => "registrations.created_at ASC")

  end
end
