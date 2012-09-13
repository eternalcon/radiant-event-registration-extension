#encoding: utf-8

class Admin::EventsController < ApplicationController
    
    def index 
        @events = Event.all
       
    end 
    
    def new
        @event = Event.new
    end

    def create
        @event = Event.new(params[:event])
         if @event.save 
            redirect_to(:action =>"index", :notice => 'Event was successfully created.')
        else 
            render_action "/admin/event/new"
        end
         
    end
    def show 
        @event = Event.find(params[:id])
    end
end
