class EventsController < ApplicationController
  def show
    raw_id = params[:id]
    id = raw_id.split("-").last

    @event = Event.by_id(id: id)
  end
end
