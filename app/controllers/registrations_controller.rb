#encoding: utf-8

class RegistrationsController < ApplicationController
  #include Recaptcha::Verify
  no_login_required
  radiant_layout 'default_layout'
  
  def index
    redirect_to(:controller => "participants", :action => "new")
  end

  def new
    @participant = Participant.new(:country => "Germany")
    @registration = Registration.new
    @registration.errors.add :base, "Word verification response is incorrect, please try again." if !params[:error].blank? && params[:error] == "true"
    
    
    @registration.event = Event.active_event
    @registration.participant = @participant
    @registration.notes = "-preferebale roommates, children?, other interesting stuff for the con"
    
  end    
  
  
  def create
    is_create = false
    @participant = Participant.new(params[:participant])
    @registration = Registration.new(params[:registration])

    if verify_recaptcha(:model => @participant, :message => "Please re-enter the words from the image again!" ) && @participant.valid?
      
      #we try to find if the person have already registered for a early event
      participant = Participant.find_by_email(@participant.email)
      
      if participant
        @registration.participant = participant
      else
        @registration.participant = @participant
      end
      
      
      if @registration.valid? 
        if @participant.save && @registration.save
          is_create = true
          flash[:notice] = "Thank you for your registration for Eternal Con 2013"
        end
      end
    else
      logger.debug("++++++ ++ + + ++ + +  else +++++++++ ")
     #@registration.valid? 
      #render :action => "new"
      is_create = false
    end
    
    respond_to do |format|
      format.html{}
      format.js{
        render :update do |page|
          #page.replace_html "flash_messages", :partial => "/shared/flash_messages"
          unless is_create
            page.replace_html "registerFormDiv", :partial => "form" 
            page.replace_html "recaptcha_div", :partial => "recaptcha"
          end
          
          #page.redirect_to new_registration_path(:error => true) unless is_create
          page.replace_html "registerFormDiv", :partial => "after_registration" if is_create 
        end
      }
    end
    

  end
end
