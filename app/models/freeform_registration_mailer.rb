#encoding: utf-8

class FreeformRegistrationMailer < ActionMailer::Base
  #
  # Diese E-Mail erhält der Interessent nach einer Anmeldung bei uns auf der Seite
  def freeform_registration_email(freeform_registration)

    recipients freeform_registration.participant.email
    from "Eternal Convention <info@eternal-con.de>"
    subject "Eternal Convention 2013: Reservation for " + freeform_registration.freeform.title
    sent_on Time.now 
    # @body[:prospective] = prosp
    content_type "multipart/alternative"

    part "text/html" do |p|
      p.body = render_message("registration_email_html", :freeform_registration => freeform_registration, :participant => freeform_registration.participant) if freeform_registration.participant.country != "Germany" 
      p.body = render_message("registration_email_ger_html", :freeform_registration => freeform_registration, :participant => freeform_registration.participant) if freeform_registration.participant.country == "Germany" 
    end

    part "text/plain" do |p|
      p.body = render_message("registration_email_plain", :freeform_registration => freeform_registration, :participant => freeform_registration.participant ) if freeform_registration.participant.country != "Germany"
      p.body = render_message("registration_email_ger_plain", :freeform_registration => freeform_registration, :participant => freeform_registration.participant) if freeform_registration.participant.country == "Germany" 
    end
  end


  def freeform_registration_team_email(freeform_registration)
    recipients_emails = Array.new
    
    freeform_registration.freeform.freeform_authors.each do |author|
      recipients_emails << author.email
    end
    
    # recipients_emails << "andreas_pittelkow@web.de" # if recipients_emails.size == 0
    # recipients_emails << "richaje@gmail.com"
    # recipients_emails << "charlotte.dincher@gmx.de"
    recipients_emails << "boris.raeschler@gmx.de"
    

    
    #recipients recipients_emails #["andreas_pittelkow@web.de", "Desiree Tillack <desiree.tillack@gmx.de>"]
    #recipients ["Boris Raeschler <boris.raeschler@gmx.de>"]
    from "Eternal Convention <info@eternal-con.de>"
    subject "Eternal Convention 2013: Freeformreservierung für " + freeform_registration.freeform.title
    sent_on Time.now 
    content_type "multipart/alternative"

    part "text/plain" do |p|
      p.body = render_message("team_email_plain", :freeform_registration => freeform_registration, :participant => freeform_registration.participant)
    end
  end
  
end
