module EventHelper
  def venue_google_maps_url(venue)
    'https://maps.google.com/?q=' + URI::encode(venue['name'] + ' ' + venue['address']['localized_address_display'])
  end

  def event_description(event)
    truncate(event['description']['text'], length: 200, separator: ' ')
  end

  def event_day(event)
    event_start_time(event).day
  end

  def event_month(event)
    event_start_time(event).strftime("%b")
  end

  def event_time(event)
    event_start_time(event).strftime("%l:%M%P")
  end

  private

  def event_start_time(event)
    Time.parse(event['start']['local'])
  end
end
