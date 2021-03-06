#encoding: utf-8
require 'recaptcha'


class GameAnnouncementsController < ApplicationController
  include Recaptcha::Verify

  no_login_required
  radiant_layout 'eternal_design'
  
  
  def new
    @event = Event.find(params[:event_id])
    @game = Game.new
    @game.event = @event
    @game.player_count = 0
    
    flash[:error] = nil
    flash[:notice] = nil
  end


  def create
    is_create = false
    @event = Event.find(params[:game][:event_id])
    @game = Game.new(params[:game])
    
    if verify_recaptcha(:model => @game, :message => "Please re-enter the words from the image again!" ) && @game.valid?

      if @game.save
        is_create = true
        flash[:notice] = "Thank you for your entry"
      else
        flash[:error] = "There has been something wrong with your entries. Maybe you have missed something"
      end
    else
      @captcha_error = true 
    end
    
    respond_to do |format|
      format.html{
        if is_create
          render
        else
          render :action => "new"
        end
      
      }
      format.js{
        render :update do |page|
          unless is_create
            page.replace_html "registerFormDiv", :partial => "form" 
          else
            page.replace_html "registerFormDiv", :partial => "after_create" 
          end
        end
      }
    end 
  end
  
end
