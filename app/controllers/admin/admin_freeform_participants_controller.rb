#encoding: utf-8

class Admin::AdminFreeformParticipantsController < ApplicationController
  before_filter :find_freeform
    
  def index 
   @registrations = @freeform.freeform_registrations
  end 
  
  def destroy
    registration = FreeformRegistration.find(params[:id])
    unless registration.blank?
      registration.destroy
      @registrations = @freeform.freeform_registrations
      flash[:notice] = "Die Registrierung wurde gelöscht"
    end
    render :action => "index"
  end
  
  
  private
  def find_freeform
    @freeform = Freeform.find(params[:freeform_id])
  end
end
