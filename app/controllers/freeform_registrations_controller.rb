#encoding: utf-8

class FreeformRegistrationsController < ApplicationController
  before_filter :find_freeform

  no_login_required
  radiant_layout 'eternal_design'
  
  def new
    @participant = Participant.new(:country => "Germany")
    @freeform_registration = FreeformRegistration.new
    @freeform_registration.freeform = @freeform unless @freeform.blank?
    flash[:error] = nil
  end
  
  
  def create
    is_create = false
    @participant = Participant.new(params[:participant])
    @freeform_registration = FreeformRegistration.new(params[:freeform_registration])

    
    if @participant.valid? && @participant.save
      @freeform_registration.participant = @participant
      @freeform_registration.freeform = @freeform unless @freeform.blank?
      
      if @freeform_registration.valid? && @freeform_registration.save
        is_create = true
        flash[:notice] = "Thank you for your registration for the freeform #{@freeform.title}. You will receive a confirmation e-mail, soon."
      end
    end    

    flash[:error] = "There have been some problem with your inputs..." unless is_create
    
    respond_to do |format|
      format.html{
        if is_create
          render :after_registration
        else
          render :new
        end
      }
      format.js{
        render :update do |page|
          #page.replace_html "flash_messages", :partial => "/shared/flash_messages"
          unless is_create
            page.replace_html "registerFormDiv", :partial => "form" 
          end
          
          #page.redirect_to new_registration_path(:error => true) unless is_create
          page.replace_html "registerFormDiv", :partial => "after_registration" if is_create 
        end
      }
    end
  end
  
  private
    def find_freeform
      @freeform = Freeform.find(params[:freeform_id])
      @freeform = Freeform.find(params[:freeform_registration][:freeform_id]) if @freeform.blank?
    end
  
    def find_event
      @event = Event.find(params[:event_id])
    end
end
