class FreeformRegistrationObserver < ActiveRecord::Observer
  
   def after_create(freeform_registration)  
     FreeformRegistrationMailer.deliver_freeform_registration_email(freeform_registration)  
     FreeformRegistrationMailer.deliver_freeform_registration_team_email(freeform_registration)  
   end
end