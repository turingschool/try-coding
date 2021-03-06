class Event
  # Calls Eventbrite API to retrieve all the
  # events for the user authenticated, grabs the attendees
  # and the venue, and then caches to entire array.
  def self.all
    Eventbrite.token = Rails.application.secrets.eventbrite_token

    # Cache block
    events_json_cache = Rails.cache.fetch('events', expires_in: 1.hour) do
      # Get all Turing events
      events = Eventbrite::User.owned_events({
        expand: 'venue',
        order_by: 'start_asc',
        status: 'live',
        user_id: 'me'
      }).events

      events = events.select do |event|
        event.status != 'started' &&
        (event.name.text.include?('Try Coding') || event.name.text.include?('Turing Second Shift'))
      end

      # Get event attendees and venue
      events.each do |event|
          event['attendees'] = Eventbrite::Attendee.all(event_id: event['id'], status: 'attending').attendees
          event['venue'] = Eventbrite::Venue.retrieve(event['venue_id']) if event['venue']
      end

      # Convert to JSON so we can store it in cache
      events.to_json
    end

    JSON.parse(events_json_cache)
  end

  def self.by_id(id:)
    found_event = self.all.find { |event| event['id'] == id }

    if !found_event
      raise ActiveRecord::RecordNotFound
    end

    found_event
  end
end
