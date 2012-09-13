#encoding: utf-8

class Admin::AdminBlocksController < ApplicationController
  include EventRegistration
  before_filter :find_event
    
    def index 
      @game_blocks = GameBlock.find(:all, :conditions => ['event_id=?',@event], :order => "order_value ASC")
    end 
    
    def new
      @game_block = GameBlock.new
    end

    def create
        @game_block = GameBlock.new(params[:game_block])
        @game_block.event = @event
         if @game_block.save 
          redirect_to(:action =>"index", :notice => 'Gameblock was successfully created.')
        else 
          render :action => "new"
        end
         
    end
    def show 
        @game_block = GameBlock.find(params[:id])
    end
    
    
    def edit
        @game_block = GameBlock.find(params[:id])
    end
    def update
      @game_block = GameBlock.find(params[:id])
      
       if @game_block.update_attributes(params[:game_block]) 
        redirect_to(:action =>"index", :notice => 'Gameblock was successfully updated.')
      else 
        render :action => "edit"
      end
    end
end
