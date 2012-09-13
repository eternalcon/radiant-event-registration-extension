#encoding: utf-8

class Admin::PricesController < ApplicationController

def index 
        @prices = Price.all
       
    end 
    
    def new
        @price = Price.new
       
    end

    def create
        @price = Price.new(params[:price])
         if @price.save 
            redirect_to(:action =>"index", :notice => 'Price was successfully created.')
        else 
            render_action "/admin/price/new"
        end
         
    end
    def show 
        @price = Price.find(params[:id])
    end
end
