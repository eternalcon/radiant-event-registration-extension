module GameAnnouncementTags
  include ActionView::Helpers
  include Radiant::Taggable
  
  desc %{
    Creates a Link for a game anouncement
  }
  tag 'get_game_anouncement_link' do |tag|
      %{<a href='/events/#{Event.active_event.id}/game_announcements/new' class="freeform_registration">Signup game round/Spielrunde Anmelden</a>}
  end
  
  
  desc %{
    Creates a tabel for all announced game rounds
  }
  tag 'game_announcement_table' do |tag|
    txt = ""
    
    Event.active_event.games.each do |game|
      txt += %{<div class="game_round_div">}
      txt += %{<h4>#{game.game_title}</h4>}
      txt += %{<table class="game_round_table">}
      txt += %{<tr><th>Author:</th><td>#{game.name_of_gamemaster}</td></tr>}
      txt += %{<tr><th>Language:</th><td>#{get_game_language game}</td></tr>}
      txt += %{<tr><th>GameSystem:</th><td>#{game.system}</td></tr>}
      txt += %{<tr><th>GameWorld:</th><td>#{game.world}</td></tr>}
      txt += %{<tr><th>Players:</th><td>#{game.player_count}</td></tr>}
      txt += %{<tr><th>GameBlock:</th><td>#{get_game_block(game)}</td></tr>}
      txt += %{<tr><th>Description:</th><td>#{simple_format(game.description)}</td></tr>}
      
      txt += %{</table>}
      txt += %{</div>}
    end
    
    
    if Event.active_event.games.size == 0
      txt += %{Sorry, there are no games to display}
    end
    
    
    return txt
  end
  #{}%{link_to("´Signup Now/Jetzt Anmelden", new_event_freeform_registratio_path(freeform.event, freeform))}
  #return link_to("´Signup Now/Jetzt Anmelden", new_event_freeform_registration_path(freeform.event, freeform))
  #return "<a href='events/#{freeform.event.id}/freeforms/#{freeform.id}/registrations/new'>Signup Now/Jetzt Anmelden</a>"
  
#  <r:link link='/events/1/freeforms/the-injustice-syndicate/registrations/new'>Signup Now/Jetzt Anmelden</r:link>
  private
  
  def get_game_block game
    if game.game_block.blank?
      return "----"
    else
      case game.game_block.title
        when "fri_evening_1"
          return "Block 1 (fri evening)"
        when "sat_early_2"
          return "Block 2 (sat early)"          
        when "sat_evening_3"
          return "Block 3 (sat evening)"          
        when "sun_early_4"
          return "Block 4 (sun early)"          
        when "sun_afternoon_4_5"
          return "Block 4/5 (sat afternoon)"          
        when "sun_evening_5"
          return "Block 5 (sat evening)" 
        end
    end
  end
  
  
  def get_game_language game
    case game.game_language
    when "en"
      return "English"
    when "de"
      return "German"
    when "fr"
      return "Francais"
    when "other"
      return "Other"
    else
      return "k.a."
    end
  end
  
end
