class Event
  # Calls Eventbrite API to retrieve all the
  # events for the user authenticated, grabs the attendees
  # and the venue, and then caches to entire array.
  def self.all
    Eventbrite.token = ENV['eventbrite']

    # Cache block
    events_json_cache = Rails.cache.fetch('events', expires_in: 1.hour) do
      # Get all Turing events
      events = Eventbrite::User.owned_events({
        user_id: 'me',
        order_by: 'start_asc',
        status: 'live'
      }).events

      # Get event attendees and venu
      events.each do |event|
          event['attendees'] = Eventbrite::Attendee.all(event_id: event['id'], status: 'attending').attendees
          event['venue'] = Eventbrite::Venue.retrieve(event['venue_id'])
      end

      # Convert to JSON so we can store it in cache
      events.to_json
    end

    JSON.parse(events_json_cache)
  end
end
