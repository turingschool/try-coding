require 'rails_helper'

describe 'user visiting homepage 'do
  scenario 'shows the events' do
    skip
    expect(Event).to receive(:all).and_return(
      [{
        'attendees' => [],
        'start' => {
          'local' => DateTime.current.to_s
        },
        'name' => {
          'text' => 'event name'
        },
        'description' => {
          'text' => 'event description'
        },
        'venue' => {
          'address' => {
            'address_1' => '123 Street Road',
            'city' => 'Denver',
            'postal_code' => '80210',
            'region' => 'CO',
            'country' => 'US',
            'localized_address_display' => 'pretty address display'
          },
          'name' => 'venue name'
        },
        'logo' => {
          'original' => {
            'url' => 'http://linktoimage.turing.com'
          }
        }
      }]
    )
    visit root_path

    within('.block-banner') do
      expect(page).to have_content('Learn the basics of programming')
    end
  end

  scenario 'visiting a particular event' do
    skip
    url = 'https://www.eventbrite.com/e/try-coding-front-back-end-2-days-tickets-40888038223'

    expect(Event).to receive(:all).and_return(
      [{
        'attendees' => [],
        'id' => '40888038223',
        'start' => {
          'local' => DateTime.current.to_s
        },
        'name' => {
          'text' => 'event name try coding'
        },
        'description' => {
          'text' => 'event description'
        },
        'url' => url,
        'venue' => {
          'address' => {
            'address_1' => '123 Street Road',
            'city' => 'Denver',
            'postal_code' => '80210',
            'region' => 'CO',
            'country' => 'US',
            'localized_address_display' => 'pretty address display'
          },
          'name' => 'venue name'
        },
        'logo' => {
          'original' => {
            'url' => 'http://linktoimage.turing.com'
          }
        }
      }]
    )

    visit event_path(url.split("/").last)

    expect(page).to have_content("event name try coding")
  end
end
