require 'rails_helper'

describe StructuredEventSerializer do
  describe '#to_json' do
    it 'renders out a string' do
      event = {
        description: {
          text: 'desc'
        },
        name: {
          text: 'event name'
        },
        start: {
          local: 'start'
        },
        venue: {
          name: 'venue name',
          address: {}
        },
        logo: {
          original: {
            url: 'img url'
          }
        },
      }.with_indifferent_access

      serializer = StructuredEventSerializer.new(event)

      result = serializer.to_json

      expect(JSON.parse(result)["name"]).to eq('event name')
    end
  end
end
