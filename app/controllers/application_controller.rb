class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @eb = EventbriteAPI.new
    organizer_id = 1314828823

    # Get a list of events
    path = "/events/search?token=#{EventbriteAPI::Configuration.access_token}"
    @eb_events = EventbriteAPI::Request.new(path, {'organizer.id': organizer_id})

    @events = @eb_events.get

    @events = @events.body['events']

    # @events.each do |event|
    #   eb_event = @eb.events(id: event['id'])
    #   event = eb_event.attendees.get
    #   pp event.body
    # end
  end
end
