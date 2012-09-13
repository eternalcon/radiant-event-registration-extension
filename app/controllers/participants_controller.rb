#encoding: utf-8

class ParticipantsController < ApplicationController
  radiant_layout 'default_layout'
  def new
    @participant = Participant.new
  end
    
  def create
    @participant = Participant.new(params[:participant])
    
    if Participant.exists?(@participant)
      flash(:notice => "Participant already exists in Database") 
    else
      if @participant.save
        redirect_to( :controller => "registration", :action => "new", :notice => 'Participant Record Created', :participant => @participant )
      else
        flash(:notice => "Error") 
      end
    end
  end

  def show
      @participant = Participant.find(params[:id])
  end
end
