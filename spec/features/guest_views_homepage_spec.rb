require 'rails_helper'

describe 'user visiting homepage 'do
  scenario 'shows the events' do
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
        }
      }]
    )
    visit root_path

    within('.block-banner') do
      expect(page).to have_content('Learn the basics of programming')
    end
  end
end
