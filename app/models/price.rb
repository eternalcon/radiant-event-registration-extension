class Price < ActiveRecord::Base
    
    # Prices are polymorphic since they might relate to different models
    
    belongs_to :pricable, :polymorphic => true
    
end
