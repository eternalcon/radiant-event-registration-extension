module EventRegistration
  def find_event
    @event = Event.find(params[:event_id]) unless params[:event_id].blank?
    return false if @event.blank?
  end
end