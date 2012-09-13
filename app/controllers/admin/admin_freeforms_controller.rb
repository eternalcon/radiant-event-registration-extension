#encoding: utf-8

class Admin::AdminFreeformsController < ApplicationController
  include EventRegistration
  before_filter :find_event
    
    def index 
      @freeforms = Freeform.find(:all, :conditions => ['event_id=?',@event])
    end 
    
    def new
      @free_form = Freeform.new
    end

    def edit
      @free_form = Freeform.find(params[:id])
    end

    def create
        @free_form = Freeform.new(params[:freeform])
        @free_form.event = @event
         if @free_form.save 
          redirect_to(:action =>"index", :notice => 'Freeform was successfully created.')
        else 
          render :action => "new"
        end
         
    end
    def show 
        @free_form = Freeform.find(params[:id])
    end
end
