#encoding: utf-8


class GameNotificationMailer < ActionMailer::Base

  def game_announcements_team_email(game)
    recipients_emails = Array.new
    
    recipients_emails << "andreas_pittelkow@web.de" if recipients_emails.size == 0
    
    recipients recipients_emails #["andreas_pittelkow@web.de", "Desiree Tillack <desiree.tillack@gmx.de>"]
    from "Eternal Convention <info@eternal-con.de>"
    subject "Eternal Convention 2011: Game Announcement for Pen-Paper-Game"
    sent_on Time.now 
    content_type "multipart/alternative"

    part "text/plain" do |p|
      p.body = render_message("team_email_plain", :game => game)
    end
  end
  
end
