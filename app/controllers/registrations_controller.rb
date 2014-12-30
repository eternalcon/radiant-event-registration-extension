#encoding: utf-8
require 'recaptcha'

class RegistrationsController < ApplicationController
  include Recaptcha::Verify

  no_login_required
  radiant_layout 'eternal_design'

  def index
    redirect_to(:controller => "participants", :action => "new")
  end

  def new
    active_event = Event.active_event
    redirect_to "/" if active_event.blank?

    @participant = Participant.new(:country => "Germany")
    @registration = Registration.new
    @registration.errors.add :base, "Word verification response is incorrect, please try again." if !params[:error].blank? && params[:error] == "true"
    @registration.event = active_event
    @registration.participant = @participant
    @registration.notes = t(:registration_notice_value)
    @registration.freeform_skill_value = t('form_freeform_skill_value.hater')

    @lang = params[:lang].gsub("'","") unless params[:lang].blank?
    @lang =  "en" if @lang.blank?
    I18n.locale = @lang

    if active_event.status_value != Event::REGISTRATION_IS_AVAILABLE
      render :action => :registration_is_not_available
    else
      render
    end
  end


  def create
    @lang = params[:lang] || "en"
    I18n.locale = @lang

    is_create = false
    @participant = Participant.new(params[:participant])
    @registration = Registration.new(params[:registration])

    if verify_recaptcha(:model => @participant, :message => "Please re-enter the words from the image again!" ) && @participant.valid?

      #we try to find if the person have already registered for a early event
      participant = Participant.find(:first, :conditions => ['first_name=? AND last_name=?', @participant.first_name, @participant.last_name])

      if participant
        @registration.participant = participant
      else
        @registration.participant = @participant
      end

      if @registration.valid? 
        if @participant.save && @registration.save
          is_create = true
          flash[:notice] = t(:fn_registration_success)
        end
      else
        flash[:error] = t(:fe_registration_error)
      end
    else
     @captcha_error = true 
     #@registration.valid? 
      #render :action => "new"
      is_create = false
     flash[:error] = t(:fe_captcha_controller)
    end

    respond_to do |format|
      format.html{
      unless is_create
        render :action => "new"
      end
      }
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
