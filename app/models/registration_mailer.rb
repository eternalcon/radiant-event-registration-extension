#encoding: utf-8

class RegistrationMailer < ActionMailer::Base
  
  #
  # Diese E-Mail erhält der Interessent nach einer Anmeldung bei uns auf der Seite
  def registration_email(registration)

    recipients registration.participant.email
    from "Eternal Convention <info@eternal-con.de>"
    subject "Eternal Convention 2012: Reservation"
    sent_on Time.now 
    # @body[:prospective] = prosp
    content_type "multipart/alternative"

    # part 'multipart/related' do |p|
    #       p.content_type = "text/html" 
    #       p.part :content_type => 'text_html', :body => render_message("welcome_prospective_email_html", :prospective => prosp)      
    #       p.part :content_type =>  :content_type => "image/png", :body => File.read("public/images/new_layout/sp_bg_headline.png") 
    #     end

    part "text/html" do |p|
      p.body = render_message("registration_email_html", :registration => registration, :participant => registration.participant) if registration.participant.country != "Germany" 
      p.body = render_message("registration_email_ger_html", :registration => registration, :participant => registration.participant) if registration.participant.country == "Germany" 
    end

    part "text/plain" do |p|
      p.body = render_message("registration_email_plain", :registration => registration, :participant => registration.participant ) if registration.participant.country != "Germany"
      p.body = render_message("registration_email_ger_plain", :registration => registration, :participant => registration.participant) if registration.participant.country == "Germany" 
    end

#    attachment :content_type => "image/png", :body => File.read("public/images/new_layout/sp_bg_headline.png") 

  end


  def registration_team_email(registration)
    recipients ["andreas_pittelkow@web.de", "Desiree Tillack <desiree.tillack@gmx.de>"]
    from "Eternal Convention <info@eternal-con.de>"
    subject "Registrierung für Eternal Convenction 2012 eingetroffen "
    sent_on Time.now 
    content_type "multipart/alternative"

    part "text/plain" do |p|
      p.body = render_message("team_email_plain", :registration => registration, :participant => registration.participant)
    end
  end
  
end
