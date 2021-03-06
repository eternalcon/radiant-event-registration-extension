class RegistrationObserver < ActiveRecord::Observer

   def after_create(registration)
     RegistrationMailer.deliver_registration_email(registration)
     RegistrationMailer.deliver_registration_team_email(registration) unless RAILS_ENV == "development"
   end
end
