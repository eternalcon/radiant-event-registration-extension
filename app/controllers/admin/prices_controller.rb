#encoding: utf-8

class Admin::PricesController < ApplicationController
 
    def index 
        @pricable = find_pricable
        @prices = @pricable.prices
       
    end 
#    def new
#    
 #       @price = Price.new
#
 #   end
    def create
        @pricable = find_pricable
        @price = @pricable.price.build(params[:price])
        if  @price.save 
            flash[:notice] = "Successfully added new price."
            redirect_to :id => nil
        else 
            render :action => "new"
        end
         
    end
    def show 
        @price = Price.find(params[:id])
    end
    
    
    def edit
        @price = Price.find(params[:id])
    end
    def update
        @price = Price.find(params[:id])
      
        if  @price.update_attributes(params[:price]) 
            redirect_to(:action =>"index", :notice => 'Price was successfully updated.')
        else 
            render :action => "edit"
        end
    end

    private

    def find_pricable
        params.each do |name, value|
            if name =~ /(.+)_id$/
                return $1.classify.constantize.find(value)
            end
        end
        nil
    end
end
