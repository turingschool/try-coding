class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'eventbrite'

  def index
    @events = Event.all
  end

  def contact
    ContactMailer.form_request(params[:name], params[:reason], params[:message]).deliver_now
    head :ok
  end
end
