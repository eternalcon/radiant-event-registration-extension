#encoding: utf-8

class Admin::PricesController < ApplicationController
 
    def index 
        @pricable = find_pricable
        @prices = @pricable.prices
       
    end 

    def new
        @pricable = find_pricable
        @price = Price.new

    end

    def create
        @pricable = find_pricable       
        @price = @pricable.prices.build(params[:price])
        if  @price.save 
            flash[:notice] = "Successfully added new price."
            redirect_to :id => nil
        else 
            render :action => "new"
        end
    end

     def edit
        @pricable = find_pricable 
        @price = @pricable.prices.find(params[:id])
    end

    def update
        @pricable = find_pricable 
        @price = @pricable.prices.find(params[:id])
      
        if  @price.update_attributes(params[:price]) 
            flash[:notice] = "Successfully updated price."
            redirect_to :action => "index", :id => nil
        else 
            render :action => "edit"
        end
    end

    def destroy
        @pricable = find_pricable 
        @price = @pricable.prices.find(params[:id]).destroy
        flash[:notice] = "Successfully deleted price."
        redirect_to :action => "index", :id => nil
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
