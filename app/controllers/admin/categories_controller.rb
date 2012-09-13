#encoding: utf-8

class Admin::CategoriesController < ApplicationController

def index 
        @categories = Category.all
       
    end 
    
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(params[:category])
         if @category.save 
            redirect_to(:action =>"index", :notice => 'Category was successfully created.')
        else 
            render_action "/admin/category/new"
        end
         
    end
    def show 
        @price = Price.find(params[:id])
    end
    
end
