module EventRegistrationTags
  include Radiant::Taggable
  
  desc %{
    Creates a Link for a freeform registration
  }
  tag 'get_freeform_register_link' do |tag|
    freeform = Freeform.find_by_title(tag.attr['title'])
    unless freeform.blank?
      %{<a href='/events/#{freeform.event.id}/freeforms/#{freeform.id}/registrations/new' class="freeform_registration">Signup Now/Jetzt Anmelden</a>}
    end
  end
  
  #{}%{link_to("´Signup Now/Jetzt Anmelden", new_event_freeform_registratio_path(freeform.event, freeform))}
  #return link_to("´Signup Now/Jetzt Anmelden", new_event_freeform_registration_path(freeform.event, freeform))
  #return "<a href='events/#{freeform.event.id}/freeforms/#{freeform.id}/registrations/new'>Signup Now/Jetzt Anmelden</a>"
  
#  <r:link link='/events/1/freeforms/the-injustice-syndicate/registrations/new'>Signup Now/Jetzt Anmelden</r:link>

  
end